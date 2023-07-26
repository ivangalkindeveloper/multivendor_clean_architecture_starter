import 'package:flutter/widgets.dart';

mixin ScopeMixin on InheritedWidget {
  static T? maybeOf<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<T>()
          : context.getElementForInheritedWidgetOfExactType<T>()?.widget as T?;

  static T of<T extends InheritedWidget>(
    BuildContext context, {
    bool listen = true,
  }) =>
      maybeOf<T>(
        context,
        listen: listen,
      ) ??
      _notFoundInheritedWidgetOfExactType();

  static Never
      _notFoundInheritedWidgetOfExactType<T extends InheritedWidget>() =>
          throw ArgumentError(
            'Inherited widget out of scope and not found of $T exact type',
            'out_of_scope',
          );
}
