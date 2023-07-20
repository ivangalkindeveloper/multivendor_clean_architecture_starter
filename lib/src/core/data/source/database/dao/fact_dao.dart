import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/dao/dao.dart';
import 'package:drift/drift.dart';

class FactDao implements IDao<FactDatabaseTableData> {
  const FactDao({
    required this.database,
  });

  final Database database;

  @override
  Future<List<FactDatabaseTableData>> get() =>
      database.select(database.factDatabaseTable).get();

  @override
  Stream<List<FactDatabaseTableData>> watch() =>
      database.select(database.factDatabaseTable).watch();

  @override
  Future<int> insert({
    required UpdateCompanion<FactDatabaseTableData> companion,
  }) =>
      database.into(database.factDatabaseTable).insert(companion);

  @override
  Future<bool> update({
    required UpdateCompanion<FactDatabaseTableData> companion,
  }) =>
      database.update(database.factDatabaseTable).replace(companion);

  @override
  Future<int> delete({
    required UpdateCompanion<FactDatabaseTableData> companion,
  }) =>
      database.delete(database.factDatabaseTable).delete(companion);
}
