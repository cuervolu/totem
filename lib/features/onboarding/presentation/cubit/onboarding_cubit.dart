import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/database/database.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final ConnectivityCubit _connectivityCubit;
  final PreferencesService _prefs;
   final TotemDatabase _db;
  final Logger _logger;
  StreamSubscription? _connectivitySubscription;

  OnboardingCubit({
    required ConnectivityCubit connectivityCubit,
    required PreferencesService prefs,
     required TotemDatabase database,
    required Logger logger,
  }) : _connectivityCubit = connectivityCubit,
       _prefs = prefs,
        _db = database,
       _logger = logger,
       super(OnboardingInitial());

  Future<void> start() async {
    final hasInternet = _connectivityCubit.state;

    emit(
      OnboardingInProgress(
        stage: OnboardingStage.welcome,
        hasInternet: hasInternet,
      ),
    );

    _connectivitySubscription = _connectivityCubit.stream.listen((isConnected) {
      final current = state;
      if (current is OnboardingInProgress) {
        emit(current.copyWith(hasInternet: isConnected));
      }
    });
  }

  void nextStage() {
    final current = state;
    if (current is! OnboardingInProgress) return;

    final nextStage = switch (current.stage) {
      OnboardingStage.welcome => OnboardingStage.configuration,
      OnboardingStage.configuration => OnboardingStage.ready,
      OnboardingStage.ready => null,
    };

    if (nextStage != null) {
      emit(current.copyWith(stage: nextStage));
    }
  }

  void setMascotName(String name) {
    final current = state;
    if (current is OnboardingInProgress) {
      emit(current.copyWith(mascotName: name.trim()));
    }
  }

  void markLocationConfigured() {
    final current = state;
    if (current is OnboardingInProgress) {
      _logger.d('Location configured during onboarding');
      emit(current.copyWith(locationConfigured: true));
    }
  }

  void skipLocationConfiguration() {
    _logger.w('User skipped location configuration');
    nextStage();
  }

  Future<void> complete() async {
    final current = state;
    if (current is OnboardingInProgress && current.mascotName != null) {
      try {
        await _db.mascotDao.createMascot(current.mascotName!);
        _logger.i('Mascot created: ${current.mascotName}');
      } catch (e) {
        _logger.e('Failed to save mascot', error: e);
      }
    }

    await _prefs.setOnboardingCompleted(true);
    _logger.i('Onboarding completed');
    emit(OnboardingComplete());
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
