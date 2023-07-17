import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

class MVSListView extends StatelessWidget {
  const MVSListView({
    required this.children,
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FPCListView(
      children: this.children,
    );
  }
}
