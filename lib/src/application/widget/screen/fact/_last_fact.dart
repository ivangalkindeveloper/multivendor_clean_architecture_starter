part of 'fact_screen.dart';

class _LastFact extends StatelessWidget {
  const _LastFact();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final IConfig config = dependency.data.config;

    final MVSSize size = context.mvsSize;

    return BlocBuilder<FactBloc, FactState>(
      builder: (
        BuildContext context,
        FactState state,
      ) {
        switch (state) {
          case FactInitialState():
            return const SizedBox();

          case FactLoadingState():
            return const MVSPrimaryCircularIndicator();

          case FactSuccessState(
              data: final FactStateData data,
            ):
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MVSText.medium16Black(
                  context,
                  "Last fact about ${config.animalType}s:",
                ),
                SizedBox(
                  height: size.s16 / 4,
                ),
                if (data.lastFact != null)
                  MVSText.regular16Black(
                    context,
                    data.lastFact!.description,
                  )
                else
                  MVSText.regular16Black(
                    context,
                    "No last fact :(",
                  ),
              ],
            );

          case FactErrorState(
              data: final FactStateData data,
            ):
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MVSText.medium16Black(
                  context,
                  "Last fact error:",
                ),
                SizedBox(
                  height: size.s16 / 4,
                ),
                if (data.lastFactError != null)
                  MVSText.regular16Danger(
                    context,
                    data.lastFactError!,
                  ),
                if (data.lastFact != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MVSText.medium16Black(
                        context,
                        "Last fact about ${config.animalType}s:",
                      ),
                      SizedBox(
                        height: size.s16 / 4,
                      ),
                      MVSText.regular16Black(
                        context,
                        data.lastFact!.description,
                      ),
                    ],
                  ),
              ],
            );
        }
      },
    );
  }
}
