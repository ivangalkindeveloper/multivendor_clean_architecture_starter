import 'package:multivendor_clean_architecture_starter/src/core/data/data_source/database/table/fact_database_table.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/platform/opener/opener.dart';
import 'package:drift/drift.dart';

part '../../../../../generated/src/core/data/data_source/database/database.g.dart';

//TODO Starter: Database
@DriftDatabase(
  tables: [
    FactDatabaseTable,
  ],
)
class Database extends _$Database {
  Database({
    required IConfig config,
  }) : super(
          Opener.openDatabase(
            name: config.databaseName,
          ),
        );

  // You should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
