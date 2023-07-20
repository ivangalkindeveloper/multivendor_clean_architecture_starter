import 'package:multi_vendor_starter/src/core/data/source/database/table/fact_database_table.dart';
import 'package:multi_vendor_starter/src/utility/opener/opener.dart';
import 'package:drift/drift.dart';

part '../../../../../generated/src/core/data/source/database/database.g.dart';

@DriftDatabase(
  tables: [
    FactDatabaseTable,
  ],
)
class Database extends _$Database {
  Database()
      : super(
          Opener.openDatabase(name: "multi_vendor_starter"),
        );

  // You should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}
