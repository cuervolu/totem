import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';
part 'tables.dart';
part 'daos/weather_dao.dart';
part 'daos/rss_dao.dart';
part 'daos/calendar_dao.dart';
part 'daos/mascot_dao.dart';

@DriftDatabase(
  tables: [
    WeatherCache,
    WeatherForecast,
    RssFeedItems,
    CalendarEvents,
    MascotProfile,
  ],
  daos: [WeatherDao, RssDao, CalendarDao, MascotDao],
)
class TotemDatabase extends _$TotemDatabase {
  TotemDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'totem.db'));
    return NativeDatabase(file);
  });
}
