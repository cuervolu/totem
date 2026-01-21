part of '../database.dart';

@DriftAccessor(tables: [MascotProfile])
class MascotDao extends DatabaseAccessor<TotemDatabase> with _$MascotDaoMixin {
  MascotDao(super.db);

  Future<MascotProfileData?> getMascot() async {
    return (select(mascotProfile)..limit(1)).getSingleOrNull();
  }

  Future<void> createMascot(String name) async {
    final existing = await getMascot();

    if (existing != null) {
      await (update(mascotProfile)..where((t) => t.id.equals(existing.id)))
          .write(MascotProfileCompanion(name: Value(name)));
    } else {
      await into(mascotProfile).insert(
        MascotProfileCompanion.insert(name: name, birthDate: DateTime.now()),
      );
    }
  }

  Future<void> updateMascotName(String newName) async {
    final mascot = await getMascot();
    if (mascot != null) {
      await (update(mascotProfile)..where((t) => t.id.equals(mascot.id))).write(
        MascotProfileCompanion(name: Value(newName)),
      );
    }
  }
}
