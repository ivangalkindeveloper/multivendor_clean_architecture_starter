import 'package:drift/drift.dart';
import 'package:drift/web.dart';

class MVSDatabaseOpener {
  static QueryExecutor openDatabase({
    required String name,
  }) =>
      WebDatabase(
        name,
      );
}
