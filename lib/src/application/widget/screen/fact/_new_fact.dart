part of 'fact_screen.dart';

class _NewFact extends StatelessWidget {
  const _NewFact();

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
                  "New fact about ${config.animalType}s:",
                ),
                SizedBox(
                  height: size.s16 / 4,
                ),
                if (data.newFact != null)
                  MVSText.regular16Black(
                    context,
                    data.newFact!.description,
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
                  "New fact error:",
                ),
                SizedBox(
                  height: size.s16 / 4,
                ),
                if (data.newFactError != null)
                  MVSText.regular16Danger(
                    context,
                    data.newFactError!,
                  ),
              ],
            );
        }
      },
    );
  }
}
