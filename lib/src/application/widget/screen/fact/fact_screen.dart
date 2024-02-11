import 'package:multivendor_clean_architecture_starter/src/utility/extension/build_context_extension.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/fact/fact_bloc.dart';
import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

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
        factRepository: dependency.data.factRepository,
      )..add(
              const FactEvent.getFact(),
            ),
      child: const _Screen(),
    );
  }
}
