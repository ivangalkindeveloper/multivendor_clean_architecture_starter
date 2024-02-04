import 'package:drift/drift.dart';

//TODO Starter: DatabaseTable
class MVSFactDatabaseTable extends Table {
  const MVSFactDatabaseTable();

  IntColumn get id => integer().autoIncrement()();
  TextColumn get factId => text()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get description => text()();
}
