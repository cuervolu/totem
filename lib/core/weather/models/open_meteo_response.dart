class OpenMeteoCurrentResponse {
  final double temperature;
  final double apparentTemperature;
  final int weatherCode;
  final int relativeHumidity;
  final double? windSpeed;
  final double? uvIndex;

  OpenMeteoCurrentResponse({
    required this.temperature,
    required this.apparentTemperature,
    required this.weatherCode,
    required this.relativeHumidity,
    this.windSpeed,
    this.uvIndex,
  });

  factory OpenMeteoCurrentResponse.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    return OpenMeteoCurrentResponse(
      temperature: (current['temperature_2m'] as num).toDouble(),
      apparentTemperature: (current['apparent_temperature'] as num).toDouble(),
      weatherCode: current['weather_code'] as int,
      relativeHumidity: current['relative_humidity_2m'] as int,
      windSpeed: (current['wind_speed_10m'] as num?)?.toDouble(),
      uvIndex: (current['uv_index'] as num?)?.toDouble(),
    );
  }
}

class OpenMeteoHourlyResponse {
  final List<DateTime> times;
  final List<double> temperatures;
  final List<int> weatherCodes;
  final List<int> precipitationProbs;

  OpenMeteoHourlyResponse({
    required this.times,
    required this.temperatures,
    required this.weatherCodes,
    required this.precipitationProbs,
  });

  factory OpenMeteoHourlyResponse.fromJson(Map<String, dynamic> json) {
    final hourly = json['hourly'] as Map<String, dynamic>;

    return OpenMeteoHourlyResponse(
      times: (hourly['time'] as List)
          .map((t) => DateTime.parse(t as String))
          .toList(),
      temperatures: (hourly['temperature_2m'] as List)
          .map((t) => (t as num).toDouble())
          .toList(),
      weatherCodes: (hourly['weather_code'] as List).cast<int>(),
      precipitationProbs: (hourly['precipitation_probability'] as List)
          .cast<int>(),
    );
  }
}
