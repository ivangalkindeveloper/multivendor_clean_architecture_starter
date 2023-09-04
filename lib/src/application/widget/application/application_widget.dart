import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/dependency_scope.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:flutter/material.dart';

//TODO Starter: ApplicationWidget
class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = DependencyScope.of(context);

    return FPCApp.router(
      context: context,
      locale: dependency.presentation.locale,
      localizationsDelegates: ApplicationLocalization.localizationsDelegates,
      supportedLocales: ApplicationLocalization.supportedLocales,
      routerConfig: dependency.presentation.router.config(),
    );
  }
}
