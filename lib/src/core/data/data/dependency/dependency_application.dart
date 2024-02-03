import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:flutter/widgets.dart';

class DependencyApplication {
  const DependencyApplication({
    required this.locale,
    required this.router,
  });

  final Locale locale;
  final ApplicationRouter router;
}
