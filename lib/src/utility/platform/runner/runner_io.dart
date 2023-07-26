import 'package:multi_vendor_starter/src/core/data/data/environment/environment.dart';
import 'package:multi_vendor_starter/src/utility/initializer/initializer.dart';

class Runner {
  static Future<void> run({
    required Environment environment,
  }) =>
      Initializer.main(
        environment: environment,
      ).initializeAndRunApp();
}
