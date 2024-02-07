import 'package:mvs_database/mvs_database.dart';
import 'package:drift/drift.dart';

part '../../../../generated/src/data/data_source/database/mvs_database.g.dart';

//TODO Starter: Database
@DriftDatabase(
  tables: [
    MVSFactDatabaseTable,
  ],
)
class MVSDatabase extends _$MVSDatabase {
  MVSDatabase({
    required String databaseName,
  }) : super(
          MVSDatabaseOpener.openDatabase(
            name: databaseName,
          ),
        );

  @override
  int get schemaVersion => 1;
}
