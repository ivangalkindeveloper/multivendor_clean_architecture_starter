import 'package:mvs_database/mvs_database.dart';
import 'package:drift/drift.dart';

//TODO Starter: DAO
class MVSFactDao implements IMVSDao<MVSFactDatabaseTableData> {
  const MVSFactDao({
    required this.database,
  });

  final MVSDatabase database;

  @override
  Future<List<MVSFactDatabaseTableData>> get() =>
      database.select(database.mVSFactDatabaseTable).get();

  @override
  Stream<List<MVSFactDatabaseTableData>> watch() =>
      database.select(database.mVSFactDatabaseTable).watch();

  @override
  Future<int> insert({
    required UpdateCompanion<MVSFactDatabaseTableData> companion,
  }) =>
      database.into(database.mVSFactDatabaseTable).insert(companion);

  @override
  Future<bool> update({
    required UpdateCompanion<MVSFactDatabaseTableData> companion,
  }) =>
      database.update(database.mVSFactDatabaseTable).replace(companion);

  @override
  Future<int> delete({
    required UpdateCompanion<MVSFactDatabaseTableData> companion,
  }) =>
      database.delete(database.mVSFactDatabaseTable).delete(companion);
}
