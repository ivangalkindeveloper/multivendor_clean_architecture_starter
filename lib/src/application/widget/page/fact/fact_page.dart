import 'package:multivendor_clean_architecture_starter/src/application/widget/component/indicator/mvs_primary_circular_indicator.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/animation/mvs_animated_size.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/app_bar/mvs_screen_app_bar.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/button/mvs_primary_button.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/default/mvs_list_view.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/scaffold/mvs_scaffold.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/text/mvs_text.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/dependency_scope.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/fact/fact_bloc.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: Page
@RoutePage()
class FactPage extends StatelessWidget {
  const FactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = DependencyScope.of(context);

    return BlocProvider(
      create: (BuildContext context) => FactBloc(
        factRepository: dependency.data.factRepository,
      )..add(const FactEvent.getFacts()),
      child: const _FactPage(),
    );
  }
}

class _FactPage extends StatelessWidget {
  const _FactPage();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = DependencyScope.of(context);
    final IConfig config = dependency.data.config;

    final IFPCSize size = context.componentSize;

    return MVSScaffold(
      appBar: MVSScreenAppBar(
        context: context,
        title: "Animal Fact",
      ),
      body: MVSListView(
        children: [
          MVSText.medium16Black(
            context: context,
            text: "Animal: ${config.animalType}",
          ),
          SizedBox(height: size.s16),
          MVSAnimatedSize(
            child: BlocBuilder<FactBloc, IFactState>(
              builder: (
                BuildContext context,
                IFactState state,
              ) {
                switch (state.lastFactStatus) {
                  case FactStatus.initial:
                    return const SizedBox();

                  case FactStatus.loading:
                    return const MVSPrimaryCircularIndicator();

                  case FactStatus.success:
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MVSText.medium16Black(
                          context: context,
                          text: "Last fact about ${config.animalType}s:",
                        ),
                        SizedBox(height: size.s16 / 4),
                        if (state.lastFact != null)
                          MVSText.regular16Black(
                            context: context,
                            text: state.lastFact!.description,
                          )
                        else
                          MVSText.regular16Black(
                            context: context,
                            text: "No last fact :(",
                          ),
                      ],
                    );

                  case FactStatus.error:
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MVSText.medium16Black(
                          context: context,
                          text: "Last fact error:",
                        ),
                        SizedBox(height: size.s16 / 4),
                        if (state.lastFactError != null)
                          MVSText.regular16Danger(
                            context: context,
                            text: state.lastFactError!,
                          ),
                        if (state.lastFact != null)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MVSText.medium16Black(
                                context: context,
                                text: "Last fact about ${config.animalType}s:",
                              ),
                              SizedBox(height: size.s16 / 4),
                              MVSText.regular16Black(
                                context: context,
                                text: state.lastFact!.description,
                              ),
                            ],
                          ),
                      ],
                    );
                }
              },
            ),
          ),
          SizedBox(height: size.s16),
          MVSAnimatedSize(
            child: BlocBuilder<FactBloc, IFactState>(
              builder: (
                BuildContext context,
                IFactState state,
              ) {
                switch (state.newFactStatus) {
                  case FactStatus.initial:
                    return const SizedBox();

                  case FactStatus.loading:
                    return const MVSPrimaryCircularIndicator();

                  case FactStatus.success:
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MVSText.medium16Black(
                          context: context,
                          text: "New fact about ${config.animalType}s:",
                        ),
                        SizedBox(height: size.s16 / 4),
                        if (state.newFact != null)
                          MVSText.regular16Black(
                            context: context,
                            text: state.newFact!.description,
                          ),
                      ],
                    );

                  case FactStatus.error:
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MVSText.medium16Black(
                          context: context,
                          text: "New fact error:",
                        ),
                        SizedBox(height: size.s16 / 4),
                        if (state.newFactError != null)
                          MVSText.regular16Danger(
                            context: context,
                            text: state.newFactError!,
                          ),
                      ],
                    );
                }
              },
            ),
          ),
          SizedBox(height: size.s16),
          BlocBuilder<FactBloc, IFactState>(
            builder: (
              BuildContext context,
              IFactState state,
            ) {
              final bool isLoading =
                  state.lastFactStatus == FactStatus.loading ||
                      state.newFactStatus == FactStatus.loading;

              return MVSPrimaryButton(
                title: "Reload",
                onPressed: () =>
                    context.read<FactBloc>().add(const FactEvent.getFacts()),
                isLoading: isLoading,
              );
            },
          ),
        ],
      ),
    );
  }
}
