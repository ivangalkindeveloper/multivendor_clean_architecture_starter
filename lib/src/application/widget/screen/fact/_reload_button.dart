part of 'fact_screen.dart';

class _ReloadButton extends StatelessWidget {
  const _ReloadButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, IFactState>(
      builder: (
        BuildContext context,
        IFactState state,
      ) {
        final bool isLoading = state.lastFactStatus == FactStatus.loading ||
            state.newFactStatus == FactStatus.loading;

        return MVSPrimaryButton(
          title: "Reload",
          onPressed: () => context.read<FactBloc>().add(
                const FactEvent.getFacts(),
              ),
          isLoading: isLoading,
        );
      },
    );
  }
}
