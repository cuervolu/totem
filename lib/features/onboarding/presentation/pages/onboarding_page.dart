import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/di/injection.dart';
import 'package:totem/core/connectivity/connectivity_cubit.dart';
import 'package:totem/core/location/presentation/location_cubit.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/features/onboarding/presentation/cubit/cubit.dart';
import 'package:totem/features/onboarding/presentation/widgets/progress_indicator.dart';
import 'package:totem/features/onboarding/presentation/widgets/stage_configuration.dart';
import 'package:totem/features/onboarding/presentation/widgets/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OnboardingCubit(
            connectivityCubit: getIt<ConnectivityCubit>(),
            prefs: getIt<PreferencesService>(),
            logger: getIt<Logger>(),
          )..start(),
        ),
        BlocProvider(create: (_) => getIt<LocationCubit>()..initialize()),
      ],
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingComplete) {
          context.go('/');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              if (state is! OnboardingInProgress) {
                return const SizedBox.shrink();
              }

              return FadeIn(
                key: ValueKey(state.stage),
                duration: const Duration(milliseconds: 400),
                child: _buildStage(context, state),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStage(BuildContext context, OnboardingInProgress state) {
    return Column(
      children: [
        const SizedBox(height: 24),
        OnboardingProgressIndicator(currentStage: state.stage),
        const SizedBox(height: 8),
        Expanded(
          child: switch (state.stage) {
            OnboardingStage.welcome => const StageWelcome(),
            OnboardingStage.configuration => const StageConfiguration(),
            OnboardingStage.ready => const StageReady(),
          },
        ),
      ],
    );
  }
}
