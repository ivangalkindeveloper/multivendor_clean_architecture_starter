import 'package:multi_vendor_starter/src/core/data/source/database/application_database.dart';

class CatFactStore {
  const CatFactStore({
    required this.applicationDatabase,
  });

  final ApplicationDatabase applicationDatabase;

  Future<List<CatFactDatabase>> getCatFacts() => applicationDatabase
      .select(applicationDatabase.catFactDatabaseTable)
      .get();

  Stream<List<CatFactDatabase>> watchCatFacts() => applicationDatabase
      .select(applicationDatabase.catFactDatabaseTable)
      .watch();

  Future<void> insertCatFact({
    required CatFactDatabaseTableCompanion companion,
  }) =>
      applicationDatabase
          .into(applicationDatabase.catFactDatabaseTable)
          .insert(companion);

  Future<void> updateCatFact({
    required CatFactDatabaseTableCompanion companion,
  }) =>
      applicationDatabase
          .update(applicationDatabase.catFactDatabaseTable)
          .replace(companion);

  Future<void> deleteCatFact({
    required CatFactDatabaseTableCompanion companion,
  }) =>
      applicationDatabase
          .delete(applicationDatabase.catFactDatabaseTable)
          .delete(companion);
}
