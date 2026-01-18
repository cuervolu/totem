part of '../database.dart';

@DriftAccessor(tables: [RssFeedItems])
class RssDao extends DatabaseAccessor<TotemDatabase> with _$RssDaoMixin {
  RssDao(super.db);

Future<List<RssFeedItem>> getUnreadItems({int limit = 20}) {
    return (select(rssFeedItems)
          ..where((t) => t.isRead.equals(false))
          ..orderBy([(t) => OrderingTerm.desc(t.publishedAt)])
          ..limit(limit))
        .get();
  }

  Future<List<RssFeedItem>> getRecentItems({int limit = 50}) {
    return (select(rssFeedItems)
          ..orderBy([(t) => OrderingTerm.desc(t.publishedAt)])
          ..limit(limit))
        .get();
  }

  Future<void> cacheItems(List<RssFeedItemsCompanion> items) async {
    await batch((batch) {
      batch.insertAll(rssFeedItems, items, mode: InsertMode.insertOrReplace);
    });
  }

  Future<void> markAsRead(int itemId) async {
    await (update(rssFeedItems)..where((t) => t.id.equals(itemId))).write(
      const RssFeedItemsCompanion(isRead: Value(true)),
    );
  }

  Future<void> cleanOldItems({int keepLast = 50, int daysOld = 7}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: daysOld));

    final idsToKeep =
        await (select(rssFeedItems)
              ..orderBy([(t) => OrderingTerm.desc(t.publishedAt)])
              ..limit(keepLast))
            .map((row) => row.id)
            .get();

    await (delete(rssFeedItems)..where(
          (t) =>
              t.publishedAt.isSmallerThanValue(cutoffDate) &
              t.id.isNotIn(idsToKeep),
        ))
        .go();
  }
}
