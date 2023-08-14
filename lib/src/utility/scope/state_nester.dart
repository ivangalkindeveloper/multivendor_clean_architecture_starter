import 'package:flutter/widgets.dart';

class StateNester extends StatelessWidget {
  const StateNester({
    super.key,
    required this.states,
    required this.child,
  });

  final List<StatefulWidget Function(Widget)> states;
  final Widget child;

  @override
  Widget build(BuildContext context) => states.reversed.fold<Widget>(
        this.child,
        (
          Widget previous,
          StatefulWidget Function(Widget) widget,
        ) =>
            widget(previous),
      );
}
