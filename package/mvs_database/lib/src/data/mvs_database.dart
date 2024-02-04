import 'package:mvs_database/mvs_database.dart';
import 'package:drift/drift.dart';

part '../../generated/src/data/mvs_database.g.dart';

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

  // You should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
