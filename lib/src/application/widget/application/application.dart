import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_time_of_day.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_text_style.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/application/application_widget.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_animation.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_date_time.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_duration.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_haptic.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/mvs_size.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/dependency_scope.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/scope/scope_nester.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: Application
class Application extends StatelessWidget {
  const Application({
    required this.result,
    super.key,
  });

  final InitializationResult result;

  @override
  Widget build(BuildContext context) {
    return ScopeNester(
      scopes: [
        (Widget child) => DependencyScope(
              dependency: Dependency(
                data: result.data,
                presentation: result.presentation,
              ),
              child: child,
            ),
      ],
      child: FlutterPlatformComponent(
        animation: const MVSAnimation(),
        textStyle: const MVSTextStyle(),
        timeOfDay: MVSTimeOfDay(),
        dateTime: MVSDateTime(),
        duration: const MVSDuration(),
        haptic: const MVSHaptic(),
        theme: this.result.data.config.themeLight,
        size: const MVSSize(),
        child: const ApplicationWidget(),
      ),
    );
  }
}
