enum WeatherAlertLevel { normal, warning, extreme }

class WeatherAlert {
  final WeatherAlertLevel level;
  final String message;
  final String badge;

  const WeatherAlert({
    required this.level,
    required this.message,
    required this.badge,
  });

  static const none = WeatherAlert(
    level: WeatherAlertLevel.normal,
    message: '',
    badge: '',
  );
}
