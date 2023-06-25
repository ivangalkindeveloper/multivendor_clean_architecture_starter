import 'package:multi_vendor_starter/src/core/utility/init_application.dart';
import 'package:multi_vendor_starter/src/core/data/implementation/enum.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> runApplication({
  required Environment environment,
}) {
  setPathUrlStrategy();

  return initApplication(
    environment: environment,
  );
}
