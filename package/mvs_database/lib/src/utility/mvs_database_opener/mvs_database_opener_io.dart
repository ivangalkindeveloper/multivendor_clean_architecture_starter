import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'dart:io';

class MVSDatabaseOpener {
  static QueryExecutor openDatabase({
    required String name,
  }) =>
      LazyDatabase(
        () async {
          final Directory databaseDirectory =
              await path_provider.getApplicationDocumentsDirectory();
          final File file = File(
            path.join(
              databaseDirectory.path,
              '$name.sqlite',
            ),
          );
          return NativeDatabase.createInBackground(
            file,
          );
        },
      );
}
