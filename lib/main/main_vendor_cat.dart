import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/platform/runner/runner.dart';

Future<void> main() => Runner.run(
      environment: Environment.vendorCat,
    );
