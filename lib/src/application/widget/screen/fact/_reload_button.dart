part of 'fact_screen.dart';

class _ReloadButton extends StatelessWidget {
  const _ReloadButton();

  @override
  Widget build(BuildContext context) {
    final ApplicationLocalization l10n = context.l10n;

    return BlocBuilder<FactBloc, FactState>(
      builder: (
        BuildContext context,
        FactState state,
      ) =>
          MVSPrimaryButton(
        title: l10n.buttonReload,
        onPressed: () => context.read<FactBloc>().add(
              const FactEvent.getFact(),
            ),
        isLoading: state is FactLoadingState,
      ),
    );
  }
}
