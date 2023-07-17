import 'package:drift/drift.dart';

@DataClassName('CatFactDatabase')
class CatFactDatabaseTable extends Table {
  const CatFactDatabaseTable();

  IntColumn get id => integer().autoIncrement()();
  TextColumn get factId => text().withLength(min: 1, max: 256)();
  TextColumn get description => text().withLength(min: 1, max: 256)();

  @override
  Set<Column> get primaryKey => {this.id};
}
