import 'package:multivendor_clean_architecture_starter/src/core/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/application/utility/mixin/scope_mixin.dart';
import 'package:flutter/material.dart';

//TODO Starter: DependencyScope
class DependencyScope extends InheritedWidget {
  const DependencyScope({
    super.key,
    required this.dependency,
    required super.child,
  });

  final Dependency dependency;

  static Dependency of(
    BuildContext context,
  ) =>
      ScopeMixin.of<DependencyScope>(
        context,
      ).dependency;

  @override
  bool updateShouldNotify(DependencyScope oldWidget) => false;
}
