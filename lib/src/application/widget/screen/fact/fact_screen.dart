import 'package:multivendor_clean_architecture_starter/src/application/utility/extension/build_context_extension.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/controller_scope.dart';
import 'package:multivendor_clean_architecture_starter/src/core/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/fact/fact_bloc.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:multivendor_clean_architecture_starter/src/core/environment.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

part '_controller.dart';
part '_last_fact.dart';
part '_new_fact.dart';
part '_reload_button.dart';
part '_screen.dart';

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
      create: (
        BuildContext context,
      ) =>
          FactBloc(
        factInteractor: dependency.factInteractor,
      )..add(
              FactEvent.getFacts(),
            ),
      child: ControllerScope(
        controller: _Controller(),
        child: const _Screen(),
      ),
    );
  }
}
