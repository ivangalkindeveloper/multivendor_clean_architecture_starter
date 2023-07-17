import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';

class CatFactStore {
  const CatFactStore({
    required this.database,
  });

  final Database database;

  Future<List<CatFactDatabase>> getCatFacts() =>
      database.select(database.catFactDatabaseTable).get();

  Stream<List<CatFactDatabase>> watchCatFacts() =>
      database.select(database.catFactDatabaseTable).watch();

  Future<void> insertCatFact({
    required CatFactDatabaseTableCompanion companion,
  }) =>
      database.into(database.catFactDatabaseTable).insert(companion);

  Future<void> updateCatFact({
    required CatFactDatabaseTableCompanion companion,
  }) =>
      database.update(database.catFactDatabaseTable).replace(companion);

  Future<void> deleteCatFact({
    required CatFactDatabaseTableCompanion companion,
  }) =>
      database.delete(database.catFactDatabaseTable).delete(companion);
}
