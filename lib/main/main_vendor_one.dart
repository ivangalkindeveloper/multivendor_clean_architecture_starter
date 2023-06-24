import 'package:multi_vendor_starter/src/core/data/implementation/enum.dart';
import 'package:multi_vendor_starter/src/core/utility/runner/runner.dart'
    as runner;

Future<void> main() => runner.runApplication(
      environment: Environment.vendorOne,
    );
