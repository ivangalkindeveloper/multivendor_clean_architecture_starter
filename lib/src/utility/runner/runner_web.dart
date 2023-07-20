import 'package:multi_vendor_starter/src/core/data/data/environment/environment.dart';
import 'package:multi_vendor_starter/src/utility/initializer/initializer.dart';
import 'package:url_strategy/url_strategy.dart';

class Runner {
  static Future<void> run({
    required Environment environment,
  }) {
    setPathUrlStrategy();

    return Initializer.main(
      environment: environment,
    ).initializeAndRunApp();
  }
}
