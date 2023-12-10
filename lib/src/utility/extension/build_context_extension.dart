import 'package:multivendor_clean_architecture_starter/src/application/widget/scope/dependency_scope.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: BuildContextExtension
extension BuildContextExtension on BuildContext {
  Dependency get dependency => DependencyScope.of(this);

  ApplicationLocalization get l10n => ApplicationLocalization.of(this);
}
