import 'package:flutter/widgets.dart';
import 'package:multivendor_clean_architecture_starter/src/application/utility/mixin/scope_mixin.dart';

//TODO Starter: ControllerScope
class ControllerScope<T extends ChangeNotifier> extends StatefulWidget {
  static T of<T extends ChangeNotifier>(
    BuildContext context,
  ) =>
      ScopeMixin.of<_Scope<T>>(
        context,
      ).controller;

  const ControllerScope({
    super.key,
    required this.controller,
    required this.child,
  });

  final T controller;
  final Widget child;

  @override
  State<ControllerScope> createState() => _ControllerScopeState();
}

class _ControllerScopeState extends State<ControllerScope> {
  @override
  void dispose() {
    this.widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _Scope(
        controller: this.widget.controller,
        child: this.widget.child,
      );
}

class _Scope<T extends ChangeNotifier> extends InheritedWidget {
  const _Scope({
    required this.controller,
    required super.child,
  });

  final T controller;

  @override
  bool updateShouldNotify(_Scope oldWidget) => false;
}
