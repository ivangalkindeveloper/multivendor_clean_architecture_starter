import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: MVSAnimatedSize
class MVSAnimatedSize extends StatelessWidget {
  const MVSAnimatedSize({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FPCAnimation animation = context.fpcAnimation;
    final FPCDuration duration = context.fpcDuration;

    return AnimatedSize(
      alignment: Alignment.topLeft,
      duration: duration.animationDefault,
      reverseDuration: duration.animationDefault,
      curve: animation.curve,
      clipBehavior: animation.clipBehavior,
      child: this.child,
    );
  }
}
