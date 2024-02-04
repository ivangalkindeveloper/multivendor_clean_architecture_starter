import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/material.dart';

//TODO Starter: MVSPadding
class MVSPadding extends StatelessWidget {
  const MVSPadding({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FPCPadding(
      child: this.child,
    );
  }
}
