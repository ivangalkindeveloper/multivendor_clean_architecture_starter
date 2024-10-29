part of 'fact_screen.dart';

class _ReloadButton extends StatelessWidget {
  const _ReloadButton();

  @override
  Widget build(BuildContext context) {
    final L10N l10n = context.l10n;

    return BlocBuilder<FactBloc, FactState>(
      builder: (
        BuildContext context,
        FactState state,
      ) =>
          MVSPrimaryButton(
        title: l10n.buttonReload,
        onPressed: () => context.read<FactBloc>().add(
              FactEvent.getFacts(),
            ),
        isLoading: state is FactLoadingState,
      ),
    );
  }
}
