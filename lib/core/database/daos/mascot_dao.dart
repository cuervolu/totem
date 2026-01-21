part of '../database.dart';

@DriftAccessor(tables: [MascotProfile])
class MascotDao extends DatabaseAccessor<TotemDatabase> with _$MascotDaoMixin {
  MascotDao(super.db);

  Future<MascotProfileData?> getMascot() async {
    return (select(mascotProfile)..limit(1)).getSingleOrNull();
  }

  Future<void> createMascot(String name) async {
    await into(mascotProfile).insert(
      MascotProfileCompanion.insert(name: name, birthDate: DateTime.now()),
    );
  }

  Future<void> updateMascotName(String newName) async {
    await (update(mascotProfile)..where((t) => t.id.equals(1))).write(
      MascotProfileCompanion(name: Value(newName)),
    );
  }
}
