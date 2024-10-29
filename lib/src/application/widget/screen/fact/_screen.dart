part of 'fact_screen.dart';

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final Environment environment = dependency.environment;

    final MVSSize size = context.mvsSize;

    final L10N l10n = context.l10n;

    return MVSScaffold(
      appBar: MVSScreenAppBar(
        context,
        title: l10n.factTitle,
      ),
      body: MVSListView(
        children: [
          MVSText.medium16Black(
            context,
            "${l10n.factAnimalDescription} ${environment.animalType}",
          ),
          SizedBox(
            height: size.s16,
          ),
          const MVSAnimatedSize(
            child: _LastFact(),
          ),
          SizedBox(
            height: size.s16,
          ),
          const MVSAnimatedSize(
            child: _NewFact(),
          ),
          SizedBox(
            height: size.s16,
          ),
          const _ReloadButton(),
        ],
      ),
    );
  }
}
