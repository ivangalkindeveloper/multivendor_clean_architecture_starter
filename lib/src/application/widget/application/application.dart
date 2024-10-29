import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/dependency_scope.dart';
import 'package:multivendor_clean_architecture_starter/src/core/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/scope_nester.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: Application
class Application extends StatelessWidget {
  const Application({
    super.key,
    required this.dependency,
  });

  final Dependency dependency;

  @override
  Widget build(BuildContext context) {
    return ScopeNester(
      scopes: [
        (
          Widget child,
        ) =>
            DependencyScope(
              dependency: dependency,
              child: child,
            ),
      ],
      child: MVSWidgetScope(
        animation: const MVSAnimation(),
        timeOfDay: MVSTimeOfDay(),
        dateTime: MVSDateTime(),
        duration: const MVSDuration(),
        haptic: const MVSHaptic(),
        theme: this.dependency.theme,
        size: const MVSSize(),
        font: const MVSFont(),
        child: Builder(
          builder: (
            BuildContext context,
          ) =>
              MVSAppRouter(
            locale: this.dependency.locale,
            localizationsDelegates: L10N.localizationsDelegates,
            supportedLocales: L10N.supportedLocales,
            routerConfig: this.dependency.router.config(),
          ),
        ),
      ),
    );
  }
}
