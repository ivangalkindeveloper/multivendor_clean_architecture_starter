part of 'fact_screen.dart';

class _LastFact extends StatelessWidget {
  const _LastFact();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final Environment environment = dependency.environment;

    final MVSSize size = context.mvsSize;

    final L10N l10n = context.l10n;

    return BlocBuilder<FactBloc, FactState>(
      builder: (
        BuildContext context,
        FactState state,
      ) =>
          switch (state) {
        FactLoadingState() => const MVSPrimaryCircularIndicator(),
        FactSuccessState() => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MVSText.medium16Black(
                context,
                l10n.factLastFactDescription(environment.animalType),
              ),
              SizedBox(
                height: size.s16 / 4,
              ),
              if (state.lastFact != null)
                MVSText.regular16Black(
                  context,
                  state.lastFact!.description,
                )
              else
                MVSText.regular16Black(
                  context,
                  l10n.factNoLastFactDescription,
                ),
            ],
          ),
        FactErrorState() => const SizedBox(),
      },
    );
  }
}
