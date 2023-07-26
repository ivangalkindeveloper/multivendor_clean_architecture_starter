import 'package:drift/drift.dart';

//TODO Starter: DatabaseTable
class FactDatabaseTable extends Table {
  const FactDatabaseTable();

  IntColumn get id => integer().autoIncrement()();
  TextColumn get factId => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get description => text()();
}
