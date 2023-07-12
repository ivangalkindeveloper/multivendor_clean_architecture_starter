import 'package:multi_vendor_starter/src/core/utility/runner/runner.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';

Future<void> main() => Runner.run(
      environment: Environment.vendorOne,
    );
