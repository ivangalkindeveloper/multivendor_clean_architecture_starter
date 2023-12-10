import 'package:multivendor_clean_architecture_starter/src/application/widget/component/indicator/mvs_primary_circular_indicator.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/animation/mvs_animated_size.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/app_bar/mvs_screen_app_bar.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/button/mvs_primary_button.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/default/mvs_list_view.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/scaffold/mvs_scaffold.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/text/mvs_text.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/extension/build_context_extension.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/fact/fact_bloc.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

part '_reload_button.dart';
part '_fact_screen.dart';
part '_last_fact.dart';
part '_new_fact.dart';

//TODO Starter: Screen
@RoutePage()
class FactScreen extends StatelessWidget {
  const FactScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;

    return BlocProvider(
      create: (BuildContext context) => FactBloc(
        factRepository: dependency.data.factRepository,
      )..add(
          const FactEvent.getFacts(),
        ),
      child: const _FactScreen(),
    );
  }
}
