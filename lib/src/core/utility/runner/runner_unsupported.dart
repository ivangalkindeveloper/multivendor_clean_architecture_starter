import 'package:multi_vendor_starter/src/core/data/implementation/enum.dart';

Future<void> runApplication({
  required Environment environment,
}) =>
    _runApplication();

Never _runApplication() =>
    throw UnsupportedError("Running unsupported platform");
