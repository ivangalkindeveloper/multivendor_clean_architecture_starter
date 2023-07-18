import 'package:multi_vendor_starter/src/presentation/component/indicator/mvs_primary_circular_indicator.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multi_vendor_starter/src/presentation/feature/page/fact_page/bloc/fact_bloc.dart';
import 'package:multi_vendor_starter/src/presentation/component/app_bar/mvs_screen_app_bar.dart';
import 'package:multi_vendor_starter/src/presentation/component/button/mvs_primary_button.dart';
import 'package:multi_vendor_starter/src/presentation/component/default/mvs_list_view.dart';
import 'package:multi_vendor_starter/src/presentation/component/scaffold/mvs_scaffold.dart';
import 'package:multi_vendor_starter/src/presentation/component/text/mvs_text.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class FactPage extends StatelessWidget {
  const FactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FactBloc(
        factRepository: context.read<InitializationResult>().factRepository,
      )..add(const FactEvent.getFacts()),
      child: const _FactPage(),
    );
  }
}

class _FactPage extends StatelessWidget {
  const _FactPage();

  @override
  Widget build(BuildContext context) {
    final IFPCSize size = context.componentSize;
    final IConfig config = context.read<InitializationResult>().config;

    return MVSScaffold(
      appBar: MVSScreenAppBar(
        context: context,
        title: "Cat Fact",
      ),
      body: MVSListView(
        children: [
          MVSText.medium16Black(
            context: context,
            text: "Config: ${config.environment.name}",
          ),
          MVSText.medium16Black(
            context: context,
            text: "URL: ${config.baseUrl}",
          ),
          SizedBox(height: size.s16),
          BlocBuilder<FactBloc, FactState>(
            builder: (
              BuildContext context,
              FactState state,
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
          SizedBox(height: size.s16),
          BlocBuilder<FactBloc, FactState>(
            builder: (
              BuildContext context,
              FactState state,
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
          SizedBox(height: size.s16),
          BlocBuilder<FactBloc, FactState>(
            builder: (
              BuildContext context,
              FactState state,
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
