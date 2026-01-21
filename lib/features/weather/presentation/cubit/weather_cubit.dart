import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/weather/open_meteo_service.dart';
import 'package:totem/features/weather/presentation/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final OpenMeteoService _service;
  final Logger _logger;
  Timer? _refreshTimer;

  WeatherCubit({required OpenMeteoService service, required Logger logger})
    : _service = service,
      _logger = logger,
      super(WeatherInitial());

  Future<void> loadWeather({bool forceRefresh = false}) async {
    final currentState = state;

    if (currentState is WeatherSuccess && !forceRefresh) {
      emit(WeatherLoading(cachedData: currentState.current));
    } else {
      emit(WeatherLoading());
    }

    try {
      final current = await _service.getCurrentWeather(
        forceRefresh: forceRefresh,
      );

      if (current == null) {
        emit(WeatherError('Configura tu ubicación primero'));
        return;
      }

      final forecast = await _service.getHourlyForecast(
        hours: 12,
        forceRefresh: forceRefresh,
      );

      emit(WeatherSuccess(current: current, forecast: forecast));
    } catch (e) {
      _logger.e('Failed to load weather', error: e);

      final cached = await _service.getCurrentWeather();
      emit(WeatherError('Error al actualizar clima', cachedData: cached));
    }
  }

  void startAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(
      const Duration(minutes: 30),
      (_) => loadWeather(forceRefresh: true),
    );
    _logger.d('Auto-refresh enabled (30min)');
  }

  void stopAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  @override
  Future<void> close() {
    stopAutoRefresh();
    return super.close();
  }
}
