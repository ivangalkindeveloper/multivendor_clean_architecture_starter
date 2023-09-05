import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/cupertino.dart';

//TODO Starter: MVSScaffold
class MVSScaffold extends StatelessWidget {
  const MVSScaffold({
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    super.key,
  });

  final ObstructingPreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return FPCScaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
