import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

class DependencyApplication {
  const DependencyApplication({
    required this.theme,
    required this.locale,
    required this.router,
  });

  final MVSTheme theme;
  final Locale locale;
  final ApplicationRouter router;
}
