import 'package:flutter/widgets.dart';

class ScopeNester extends StatelessWidget {
  const ScopeNester({
    super.key,
    required this.scopes,
    required this.child,
  });

  final List<InheritedWidget Function(Widget)> scopes;
  final Widget child;

  @override
  Widget build(BuildContext context) => scopes.reversed.fold<Widget>(
        this.child,
        (
          Widget previous,
          InheritedWidget Function(Widget) inherited,
        ) =>
            inherited(previous),
      );
}
