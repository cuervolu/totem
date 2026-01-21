import 'package:totem/core/database/database.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {
  final WeatherCacheData? cachedData;
  WeatherLoading({this.cachedData});
}

class WeatherSuccess extends WeatherState {
  final WeatherCacheData current;
  final List<WeatherForecastData> forecast;

  WeatherSuccess({required this.current, this.forecast = const []});
}

class WeatherError extends WeatherState {
  final String message;
  final WeatherCacheData? cachedData;

  WeatherError(this.message, {this.cachedData});
}
