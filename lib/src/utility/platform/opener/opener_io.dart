import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'dart:io';

class Opener {
  static QueryExecutor openDatabase({
    required String name,
  }) =>
      // The LazyDatabase util lets us find the right location for the file async.
      LazyDatabase(() async {
        // Put the database file, called db.sqlite here, into the documents folder
        // for your app.
        final Directory databaseDirectory =
            await path_provider.getApplicationDocumentsDirectory();
        final File file =
            File(path.join(databaseDirectory.path, '$name.sqlite'));
        return NativeDatabase.createInBackground(file);
      });
}
