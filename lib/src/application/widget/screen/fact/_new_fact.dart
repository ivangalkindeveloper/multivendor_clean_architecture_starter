part of 'fact_screen.dart';

class _NewFact extends StatelessWidget {
  const _NewFact();

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
                l10n.factNewFactDescription(environment.animalType),
              ),
              SizedBox(
                height: size.s16 / 4,
              ),
              if (state.newFact != null)
                MVSText.regular16Black(
                  context,
                  state.newFact!.description,
                ),
            ],
          ),
        FactErrorState() => const SizedBox(),
      },
    );
  }
}
