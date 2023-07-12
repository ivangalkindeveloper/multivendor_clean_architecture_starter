import 'package:multi_vendor_starter/src/core/utility/initializer/initializer.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';

class Runner {
  static Future<void> run({
    required Environment environment,
  }) =>
      Initializer.main(
        environment: environment,
      ).initializeAndRunApp();
}
