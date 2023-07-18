import 'package:drift/drift.dart';

@DataClassName('FactDatabase')
class FactDatabaseTable extends Table {
  const FactDatabaseTable();

  IntColumn get id => integer().autoIncrement()();
  TextColumn get factId => text().withLength(min: 1, max: 256)();
  TextColumn get description => text().withLength(min: 1, max: 256)();
}
