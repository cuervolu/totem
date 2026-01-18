part of '../database.dart';

@DriftAccessor(tables: [WeatherCache, WeatherForecast])
class WeatherDao extends DatabaseAccessor<TotemDatabase>
    with _$WeatherDaoMixin {
  WeatherDao(super.db);

  Future<WeatherCacheData?> getCurrentWeather() async {
    final query = select(weatherCache)
      ..where((t) => t.expiresAt.isBiggerThanValue(DateTime.now()))
      ..orderBy([(t) => OrderingTerm.desc(t.cachedAt)])
      ..limit(1);
    return query.getSingleOrNull();
  }

  Future<void> cacheCurrentWeather(WeatherCacheCompanion weather) async {
    await delete(weatherCache).go();
    await into(weatherCache).insert(weather);
  }

  Future<List<WeatherForecastData>> getForecast({int hoursAhead = 12}) async {
    final now = DateTime.now();
    final cutoff = now.add(Duration(hours: hoursAhead));

    return (select(weatherForecast)
          ..where(
            (t) =>
                t.forecastTime.isBiggerThanValue(now) &
                t.forecastTime.isSmallerThanValue(cutoff),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.forecastTime)]))
        .get();
  }

  Future<void> cacheForecast(List<WeatherForecastCompanion> forecasts) async {
    await delete(weatherForecast).go();
    await batch((batch) {
      batch.insertAll(weatherForecast, forecasts);
    });
  }

  Future<void> cleanOldForecasts() async {
    final cutoff = DateTime.now().subtract(const Duration(hours: 24));
    await (delete(
      weatherForecast,
    )..where((t) => t.forecastTime.isSmallerThanValue(cutoff))).go();
  }
}
