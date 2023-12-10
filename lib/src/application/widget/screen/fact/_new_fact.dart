part of 'fact_screen.dart';

class _NewFact extends StatelessWidget {
  const _NewFact();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final IConfig config = dependency.data.config;

    final IFPCSize size = context.fpcSize;

    return BlocBuilder<FactBloc, IFactState>(
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
                  context,
                  "New fact about ${config.animalType}s:",
                ),
                SizedBox(height: size.s16 / 4),
                if (state.newFact != null)
                  MVSText.regular16Black(
                    context,
                    state.newFact!.description,
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
                  "New fact error:",
                ),
                SizedBox(height: size.s16 / 4),
                if (state.newFactError != null)
                  MVSText.regular16Danger(
                    context,
                    state.newFactError!,
                  ),
              ],
            );
        }
      },
    );
  }
}
