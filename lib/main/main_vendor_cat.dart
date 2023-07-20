import 'package:multi_vendor_starter/src/core/data/data/environment/environment.dart';
import 'package:multi_vendor_starter/src/utility/runner/runner.dart';

Future<void> main() => Runner.run(
      environment: Environment.vendorCat,
    );
