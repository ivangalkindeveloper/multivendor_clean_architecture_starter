import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: MVSPrimaryCircularIndicator
class MVSPrimaryCircularIndicator extends StatelessWidget {
  const MVSPrimaryCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FPCCircularIndicator.primary(
      context: context,
    );
  }
}
