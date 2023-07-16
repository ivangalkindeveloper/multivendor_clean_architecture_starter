import 'package:multi_vendor_starter/src/presentation/component/indicator/mvs_primary_circular_indicator.dart';
import 'package:multi_vendor_starter/src/presentation/feature/page/cat_fact_page/bloc/cat_fact_bloc.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multi_vendor_starter/src/presentation/component/app_bar/mvs_screen_app_bar.dart';
import 'package:multi_vendor_starter/src/presentation/component/button/mvs_primary_button.dart';
import 'package:multi_vendor_starter/src/presentation/component/scaffold/mvs_scaffold.dart';
import 'package:multi_vendor_starter/src/presentation/component/default/padding.dart';
import 'package:multi_vendor_starter/src/presentation/component/text/mvs_text.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class CatFactPage extends StatelessWidget {
  const CatFactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CatFactBloc(
        catFactRepository:
            context.read<InitializationResult>().catFactRepository,
      )..add(
          const CatFactEvent.intial(),
        ),
      child: const _CatFactPage(),
    );
  }
}

class _CatFactPage extends StatelessWidget {
  const _CatFactPage();

  @override
  Widget build(BuildContext context) {
    final IFPCSize size = context.componentSize;
    final IConfig config = context.read<InitializationResult>().config;

    return MVSScaffold(
      appBar: MVSScreenAppBar(
        context: context,
        title: "Cat Fact",
      ),
      body: MVSPadding(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MVSText.medium16Black(
                context: context,
                text: "Config: ${config.environment.name}",
              ),
              SizedBox(height: size.s16 / 4),
              BlocBuilder<CatFactBloc, CatFactState>(
                builder: (
                  BuildContext context,
                  CatFactState state,
                ) {
                  switch (state.lastCatFactStatus) {
                    case CatFactStatus.initial:
                    case CatFactStatus.error:
                      return const SizedBox();

                    case CatFactStatus.loading:
                      return const MVSPrimaryCircularIndicator();

                    case CatFactStatus.success:
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MVSText.medium16Black(
                            context: context,
                            text: "Last fact about cats:",
                          ),
                          SizedBox(height: size.s16 / 4),
                          if (state.lastCatFact != null)
                            MVSText.regular16Black(
                              context: context,
                              text: state.lastCatFact!.text,
                            ),
                        ],
                      );
                  }
                },
              ),
              SizedBox(height: size.s16 / 2),
              BlocBuilder<CatFactBloc, CatFactState>(
                builder: (
                  BuildContext context,
                  CatFactState state,
                ) {
                  switch (state.newCatFactStatus) {
                    case CatFactStatus.initial:
                    case CatFactStatus.error:
                      return const SizedBox();

                    case CatFactStatus.loading:
                      return const MVSPrimaryCircularIndicator();

                    case CatFactStatus.success:
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MVSText.medium16Black(
                            context: context,
                            text: "New fact about cats:",
                          ),
                          SizedBox(height: size.s16 / 4),
                          if (state.newCatFact != null)
                            MVSText.regular16Black(
                              context: context,
                              text: state.newCatFact!.text,
                            ),
                        ],
                      );
                  }
                },
              ),
              SizedBox(height: size.s16 / 2),
              BlocBuilder<CatFactBloc, CatFactState>(
                builder: (
                  BuildContext context,
                  CatFactState state,
                ) {
                  final bool isLoading =
                      state.lastCatFactStatus == CatFactStatus.loading ||
                          state.newCatFactStatus == CatFactStatus.loading;

                  return MVSPrimaryButton(
                    title: "Reload",
                    onPressed: () => context
                        .read<CatFactBloc>()
                        .add(const CatFactEvent.reload()),
                    isLoading: isLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
