part of 'fact_screen.dart';

class _NewFact extends StatelessWidget {
  const _NewFact();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final IConfig config = dependency.data.config;
    final MVSSize size = context.mvsSize;
    final ApplicationLocalization l10n = context.l10n;

    return BlocBuilder<FactBloc, FactState>(
      builder: (
        BuildContext context,
        FactState state,
      ) =>
          switch (state) {
        FactInitialState() => const SizedBox(),
        FactLoadingState() => const MVSPrimaryCircularIndicator(),
        FactSuccessState(
          data: final FactStateData data,
        ) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MVSText.medium16Black(
                context,
                l10n.factNewFactDescription(config.animalType),
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
          ),
        FactErrorState(
          data: final FactStateData data,
        ) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MVSText.medium16Black(
                context,
                l10n.errorNewFact,
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
          ),
      },
    );
  }
}
