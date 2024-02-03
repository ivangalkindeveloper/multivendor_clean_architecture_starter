part of 'fact_screen.dart';

class _LastFact extends StatelessWidget {
  const _LastFact();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final IConfig config = dependency.data.config;

    final FPCSize size = context.fpcSize;

    return BlocBuilder<FactBloc, IFactState>(
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
                  context,
                  "Last fact about ${config.animalType}s:",
                ),
                SizedBox(height: size.s16 / 4),
                if (state.lastFact != null)
                  MVSText.regular16Black(
                    context,
                    state.lastFact!.description,
                  )
                else
                  MVSText.regular16Black(
                    context,
                    "No last fact :(",
                  ),
              ],
            );

          case FactStatus.error:
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MVSText.medium16Black(
                  context,
                  "Last fact error:",
                ),
                SizedBox(height: size.s16 / 4),
                if (state.lastFactError != null)
                  MVSText.regular16Danger(
                    context,
                    state.lastFactError!,
                  ),
                if (state.lastFact != null)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MVSText.medium16Black(
                        context,
                        "Last fact about ${config.animalType}s:",
                      ),
                      SizedBox(height: size.s16 / 4),
                      MVSText.regular16Black(
                        context,
                        state.lastFact!.description,
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
