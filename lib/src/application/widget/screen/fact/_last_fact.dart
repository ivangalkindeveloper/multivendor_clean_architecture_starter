part of 'fact_screen.dart';

class _LastFact extends StatelessWidget {
  const _LastFact();

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
                l10n.factLastFactDescription(config.animalType),
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
                  l10n.factNoLastFactDescription,
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
                l10n.errorLastFact,
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
                      l10n.factLastFactDescription(config.animalType),
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
          )
      },
    );
  }
}
