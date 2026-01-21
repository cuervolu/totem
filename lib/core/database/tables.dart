part of 'database.dart';

class WeatherCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get currentTemp => real()();
  RealColumn get feelsLike => real()();
  IntColumn get weatherCode => integer()(); // WMO code
  TextColumn get condition =>
      text()(); // "sunny", "rain" 
  IntColumn get humidity => integer()();
  IntColumn get windSpeed => integer().nullable()();
  IntColumn get uvIndex => integer().nullable()();
  IntColumn get airQuality => integer().nullable()(); // AQI
  DateTimeColumn get cachedAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();
}

class WeatherForecast extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get forecastTime => dateTime()();
  RealColumn get temp => real()();
  IntColumn get weatherCode => integer()();
  TextColumn get condition => text()();
  IntColumn get precipitationProb => integer()(); // 0-100%
  DateTimeColumn get cachedAt => dateTime()();
}

class RssFeedItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get feedSource => text()();
  TextColumn get title => text()();
  TextColumn get link => text()();
  TextColumn get summary => text().nullable()();
  TextColumn get imageUrl => text().nullable()(); 
  DateTimeColumn get publishedAt => dateTime()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get cachedAt => dateTime()();
  @override
  List<Set<Column>> get uniqueKeys => [
    {feedSource, link},
  ];
}

class CalendarEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get externalId => text()(); // Google/iCal UUID
  TextColumn get title => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get description => text().nullable()();
  TextColumn get location => text().nullable()();
  IntColumn get color => integer().nullable()(); // Hex color code
  TextColumn get source => text()(); // "google", "ical", "manual"
  DateTimeColumn get syncedAt => dateTime()();
  @override
  List<Set<Column>> get uniqueKeys => [
    {source, externalId}, // Prevent duplicates per source
  ];
}

class MascotProfile extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get birthDate => dateTime()();
}
