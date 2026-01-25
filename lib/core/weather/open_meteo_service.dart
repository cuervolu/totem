import 'package:dio/dio.dart';
import 'package:drift/drift.dart' as drift;
import 'package:logger/logger.dart';
import 'package:totem/core/database/database.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:totem/core/weather/models/open_meteo_response.dart';
import 'package:totem/core/weather/weather_code_mapper.dart';

class OpenMeteoService {
  final Dio _dio;
  final WeatherDao _weatherDao;
  final PreferencesService _prefs;
  final Logger _logger;

  static const _baseUrl = 'https://api.open-meteo.com/v1';
  static const _cacheDuration = Duration(minutes: 30);

  OpenMeteoService({
    required WeatherDao weatherDao,
    required PreferencesService prefs,
    required Logger logger,
    Dio? dio,
  }) : _weatherDao = weatherDao,
       _prefs = prefs,
       _logger = logger,
       _dio =
           dio ??
           Dio(
             BaseOptions(
               baseUrl: _baseUrl,
               connectTimeout: const Duration(seconds: 10),
               receiveTimeout: const Duration(seconds: 10),
             ),
           );

  Future<WeatherCacheData?> getCurrentWeather({
    bool forceRefresh = false,
  }) async {
    final location = _prefs.getLocation();
    if (location == null) {
      _logger.w('No location configured');
      return null;
    }
    if (!forceRefresh) {
      final cached = await _weatherDao.getCurrentWeather();
      if (cached != null) {
        const tolerance = 0.01; // ~1km
        final latMatch =
            (cached.latitude - location.latitude).abs() < tolerance;
        final lonMatch =
            (cached.longitude - location.longitude).abs() < tolerance;

        if (latMatch && lonMatch) {
          _logger.d('Returning cached weather for current location');
          return cached;
        } else {
          _logger.w('Location changed, invalidating cache');
          await _weatherDao.clearAllWeatherCache();
        }
      }
    }

    try {
      _logger.d('Fetching weather from Open-Meteo');

      final response = await _dio.get(
        '/forecast',
        queryParameters: {
          'latitude': location.latitude,
          'longitude': location.longitude,
          'current': [
            'temperature_2m',
            'apparent_temperature',
            'relative_humidity_2m',
            'weather_code',
            'wind_speed_10m',
            'uv_index',
          ].join(','),
          'timezone': 'auto',
        },
      );

      final current = OpenMeteoCurrentResponse.fromJson(response.data);
      final condition = WeatherCodeMapper.getCondition(current.weatherCode);

      final weatherCompanion = WeatherCacheCompanion(
        latitude: drift.Value(location.latitude),
        longitude: drift.Value(location.longitude),
        currentTemp: drift.Value(current.temperature),
        feelsLike: drift.Value(current.apparentTemperature),
        weatherCode: drift.Value(current.weatherCode),
        condition: drift.Value(condition),
        humidity: drift.Value(current.relativeHumidity),
        windSpeed: drift.Value(current.windSpeed?.round()),
        uvIndex: drift.Value(current.uvIndex?.round()),
        airQuality: const drift.Value.absent(),
        cachedAt: drift.Value(DateTime.now()),
        expiresAt: drift.Value(DateTime.now().add(_cacheDuration)),
      );

      await _weatherDao.cacheCurrentWeather(weatherCompanion);

      final saved = await _weatherDao.getCurrentWeather();
      _logger.i('Weather cached successfully');
      return saved;
    } on DioException catch (e) {
      _logger.e('Open-Meteo API error: ${e.message}');
      rethrow;
    }
  }

  Future<List<WeatherForecastData>> getHourlyForecast({
    int hours = 12,
    bool forceRefresh = false,
  }) async {
    if (!forceRefresh) {
      final cached = await _weatherDao.getForecast(hoursAhead: hours);
      if (cached.isNotEmpty) {
        _logger.d('Returning cached forecast');
        return cached;
      }
    }

    final location = _prefs.getLocation();
    if (location == null) return [];

    try {
      _logger.d('Fetching forecast from Open-Meteo');

      final response = await _dio.get(
        '/forecast',
        queryParameters: {
          'latitude': location.latitude,
          'longitude': location.longitude,
          'hourly': [
            'temperature_2m',
            'weather_code',
            'precipitation_probability',
          ].join(','),
          'forecast_hours': hours,
          'timezone': 'auto',
        },
      );

      final hourly = OpenMeteoHourlyResponse.fromJson(response.data);
      final now = DateTime.now();

      final forecasts = <WeatherForecastCompanion>[];
      for (var i = 0; i < hourly.times.length; i++) {
        if (hourly.times[i].isAfter(now)) {
          forecasts.add(
            WeatherForecastCompanion(
              forecastTime: drift.Value(hourly.times[i]),
              temp: drift.Value(hourly.temperatures[i]),
              weatherCode: drift.Value(hourly.weatherCodes[i]),
              condition: drift.Value(
                WeatherCodeMapper.getCondition(hourly.weatherCodes[i]),
              ),
              precipitationProb: drift.Value(hourly.precipitationProbs[i]),
              cachedAt: drift.Value(now),
            ),
          );
        }
      }

      await _weatherDao.cacheForecast(forecasts);
      await _weatherDao.cleanOldForecasts();

      _logger.i('Forecast cached: ${forecasts.length} hours');
      return _weatherDao.getForecast(hoursAhead: hours);
    } on DioException catch (e) {
      _logger.e('Forecast API error: ${e.message}');
      rethrow;
    }
  }
}
