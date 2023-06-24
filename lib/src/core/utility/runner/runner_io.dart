import 'package:multi_vendor_starter/src/core/utility/runner/init_run_application.dart';
import 'package:multi_vendor_starter/src/core/data/implementation/enum.dart';

Future<void> runApplication({
  required Environment environment,
}) =>
    initRunApplication(
      environment: environment,
    );
