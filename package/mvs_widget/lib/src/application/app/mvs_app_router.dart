import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

class MVSAppRouter extends StatelessWidget {
  const MVSAppRouter({
    super.key,
    this.locale,
    this.localizationsDelegates = const [],
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.routerConfig,
  });

  final Locale? locale;
  final List<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final List<Locale> supportedLocales;
  final RouterConfig<Object>? routerConfig;

  @override
  Widget build(BuildContext context) {
    return FPCAppRouter(
      locale: this.locale,
      localizationsDelegates: this.localizationsDelegates,
      supportedLocales: this.supportedLocales,
      routerConfig: this.routerConfig,
    );
  }
}
