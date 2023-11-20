import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';

class Runner {
  static Future<void> run(
    Environment environment,
  ) =>
      _run();

  static Never _run() => throw UnsupportedError("Unsupported platform");
}
