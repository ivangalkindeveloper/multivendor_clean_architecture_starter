import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

class Application extends StatelessWidget {
  const Application({
    required this.result,
    super.key,
  });

  final InitializationResult result;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<InitializationResult>.value(
      value: result,
      child: FlutterPlatformComponent(
        child: Builder(builder: (BuildContext context) {
          return FPCApp.router(
            context: context,
            locale: this.result.locale,
            localizationsDelegates:
                ApplicationLocalization.localizationsDelegates,
            supportedLocales: ApplicationLocalization.supportedLocales,
            routerConfig: this.result.router.config(),
          );
        }),
      ),
    );
  }
}
