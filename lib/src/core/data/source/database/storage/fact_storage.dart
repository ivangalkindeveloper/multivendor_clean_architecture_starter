import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';

abstract class IFactStorage {
  Future<List<FactDatabase>> get();

  Stream<List<FactDatabase>> watch();

  Future<void> insert({
    required FactDatabaseTableCompanion companion,
  });

  Future<void> update({
    required FactDatabaseTableCompanion companion,
  });

  Future<void> delete({
    required FactDatabaseTableCompanion companion,
  });
}

class FactStorage implements IFactStorage {
  const FactStorage({
    required this.database,
  });

  final Database database;

  @override
  Future<List<FactDatabase>> get() =>
      database.select(database.factDatabaseTable).get();

  @override
  Stream<List<FactDatabase>> watch() =>
      database.select(database.factDatabaseTable).watch();

  @override
  Future<void> insert({
    required FactDatabaseTableCompanion companion,
  }) =>
      database.into(database.factDatabaseTable).insert(companion);

  @override
  Future<void> update({
    required FactDatabaseTableCompanion companion,
  }) =>
      database.update(database.factDatabaseTable).replace(companion);

  @override
  Future<void> delete({
    required FactDatabaseTableCompanion companion,
  }) =>
      database.delete(database.factDatabaseTable).delete(companion);
}
