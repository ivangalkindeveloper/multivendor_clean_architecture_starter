import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/initializer/initializer.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/logger/logger.dart';
import 'package:url_strategy/url_strategy.dart';
import 'dart:async';

class Runner {
  static Future<void> run({
    required Environment environment,
  }) async {
    setPathUrlStrategy();

    runZonedGuarded<Future<void>>(
      Initializer.main(
        environment: environment,
      ).initializeAndRunApp,
      Logger.logZoneError,
    );
  }
}
