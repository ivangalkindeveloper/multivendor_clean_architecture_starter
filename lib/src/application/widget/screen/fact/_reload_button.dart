part of 'fact_screen.dart';

class _ReloadButton extends StatelessWidget {
  const _ReloadButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, FactState>(
      builder: (
        BuildContext context,
        FactState state,
      ) =>
          MVSPrimaryButton(
        title: "Reload",
        onPressed: () => context.read<FactBloc>().add(
              const FactEvent.getFact(),
            ),
        isLoading: state is FactLoadingState,
      ),
    );
  }
}
