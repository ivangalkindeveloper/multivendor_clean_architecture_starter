part of 'fact_screen.dart';

class _FactScreen extends StatelessWidget {
  const _FactScreen();

  @override
  Widget build(BuildContext context) {
    final Dependency dependency = context.dependency;
    final IConfig config = dependency.data.config;

    final IFPCSize size = context.fpcSize;

    return MVSScaffold(
      appBar: MVSScreenAppBar(
        context,
        title: "Animal Fact",
      ),
      body: MVSListView(
        children: [
          MVSText.medium16Black(
            context,
            "Animal: ${config.animalType}",
          ),
          SizedBox(height: size.s16),
          const MVSAnimatedSize(
            child: _LastFact(),
          ),
          SizedBox(height: size.s16),
          const MVSAnimatedSize(
            child: _NewFact(),
          ),
          SizedBox(height: size.s16),
          const _ReloadButton(),
        ],
      ),
    );
  }
}
