part of '../database.dart';

@DriftAccessor(tables: [CalendarEvents])
class CalendarDao extends DatabaseAccessor<TotemDatabase>
    with _$CalendarDaoMixin {
  CalendarDao(super.db);

  Future<List<CalendarEvent>> getUpcomingEvents({int limit = 5}) {
    final now = DateTime.now();
    return (select(calendarEvents)
          ..where((t) => t.startTime.isBiggerOrEqualValue(now))
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)])
          ..limit(limit))
        .get();
  }

  Future<List<CalendarEvent>> getEventsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    return (select(calendarEvents)
          ..where(
            (t) =>
                t.startTime.isBiggerOrEqualValue(start) &
                t.startTime.isSmallerThanValue(end),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
        .get();
  }

  Future<void> syncEvents(List<CalendarEventsCompanion> events) async {
    await batch((batch) {
      batch.insertAll(calendarEvents, events, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> upsertEvent(CalendarEventsCompanion event) async {
    await into(calendarEvents).insertOnConflictUpdate(event);
  }

  Future<void> cleanOldEvents({int daysOld = 30}) async {
    final cutoff = DateTime.now().subtract(Duration(days: daysOld));
    await (delete(
      calendarEvents,
    )..where((t) => t.endTime.isSmallerThanValue(cutoff))).go();
  }

  Future<CalendarEvent?> getEventByExternalId(
    String source,
    String externalId,
  ) {
    return (select(calendarEvents)..where(
          (t) => t.source.equals(source) & t.externalId.equals(externalId),
        ))
        .getSingleOrNull();
  }
}
