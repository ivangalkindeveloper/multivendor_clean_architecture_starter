import 'package:drift/drift.dart';

class MVSDatabaseOpener {
  static QueryExecutor openDatabase({
    required String name,
  }) =>
      _openDatabase();

  static Never _openDatabase() => throw UnsupportedError(
        "Running unsupported platform",
      );
}
