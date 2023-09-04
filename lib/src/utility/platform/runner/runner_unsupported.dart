import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';

class Runner {
  static Future<void> run({
    required Environment environment,
  }) =>
      _runApplication();

  static Never _runApplication() =>
      throw UnsupportedError("Running unsupported platform");
}
