import 'package:multi_vendor_starter/src/core/data/data/environment.dart';

class Runner {
  static Future<void> run({
    required Environment environment,
  }) =>
      _runApplication();

  static Never _runApplication() =>
      throw UnsupportedError("Running unsupported platform");
}
