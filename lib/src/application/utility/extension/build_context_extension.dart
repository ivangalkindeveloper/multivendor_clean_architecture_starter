import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/controller_scope.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/dependency_scope.dart';
import 'package:multivendor_clean_architecture_starter/src/core/dependency.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: BuildContextExtension
extension BuildContextExtension on BuildContext {
  Dependency get dependency => DependencyScope.of(this);

  T controller<T extends ChangeNotifier>() => ControllerScope.of<T>(this);

  L10N get l10n => L10N.of(this);
}
