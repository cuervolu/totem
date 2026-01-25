import 'package:totem/core/database/database.dart';
import 'package:totem/core/weather/models/weather_alert.dart';

class WeatherAlertEvaluator {
  static WeatherAlert evaluate(WeatherCacheData data) {
    final alerts = <WeatherAlert>[];

    final tempAlert = _evaluateTemperature(
      data.currentTemp,
      data.feelsLike,
      data.humidity,
    );
    if (tempAlert != null) alerts.add(tempAlert);

    final uvAlert = _evaluateUV(data.uvIndex);
    if (uvAlert != null) alerts.add(uvAlert);

    final windAlert = _evaluateWind(data.windSpeed);
    if (windAlert != null) alerts.add(windAlert);

    if (alerts.isEmpty) return WeatherAlert.none;

    alerts.sort((a, b) => b.level.index.compareTo(a.level.index));
    return alerts.first;
  }

  static WeatherAlert? _evaluateTemperature(
    double temp,
    double feelsLike,
    int humidity,
  ) {
    if (feelsLike > 35) {
      return WeatherAlert(
        level: WeatherAlertLevel.extreme,
        message: 'Calor extremo: ${feelsLike.round()}°C percibidos',
        badge: 'CALOR EXTREMO',
      );
    }

    if (feelsLike > 30) {
      final humidityFactor = humidity > 70 ? ' (húmedo)' : '';
      return WeatherAlert(
        level: WeatherAlertLevel.warning,
        message: 'Temperatura alta$humidityFactor',
        badge: 'CALOR',
      );
    }

    if (feelsLike < 0) {
      return WeatherAlert(
        level: WeatherAlertLevel.extreme,
        message: 'Frío extremo: ${feelsLike.round()}°C percibidos',
        badge: 'FRÍO EXTREMO',
      );
    }

    if (feelsLike < 5) {
      return WeatherAlert(
        level: WeatherAlertLevel.warning,
        message: 'Temperatura baja',
        badge: 'FRÍO',
      );
    }

    if (humidity > 85 && temp > 20) {
      return WeatherAlert(
        level: WeatherAlertLevel.warning,
        message: 'Humedad sofocante: $humidity%',
        badge: 'HÚMEDO',
      );
    }

    return null;
  }

  static WeatherAlert? _evaluateUV(int? uvIndex) {
    if (uvIndex == null) return null;

    if (uvIndex >= 11) {
      return WeatherAlert(
        level: WeatherAlertLevel.extreme,
        message: 'UV extremo: protección obligatoria',
        badge: 'UV EXTREMO',
      );
    }

    if (uvIndex >= 8) {
      return WeatherAlert(
        level: WeatherAlertLevel.warning,
        message: 'UV muy alto: usa protección',
        badge: 'UV ALTO',
      );
    }

    return null;
  }

  static WeatherAlert? _evaluateWind(int? windSpeed) {
    if (windSpeed == null) return null;

    if (windSpeed > 60) {
      return WeatherAlert(
        level: WeatherAlertLevel.extreme,
        message: 'Viento muy fuerte: $windSpeed km/h',
        badge: 'VIENTO FUERTE',
      );
    }

    if (windSpeed > 40) {
      return WeatherAlert(
        level: WeatherAlertLevel.warning,
        message: 'Viento fuerte: $windSpeed km/h',
        badge: 'VIENTO',
      );
    }

    return null;
  }
}
