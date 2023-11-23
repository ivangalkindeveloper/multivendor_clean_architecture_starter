import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';

part '../../../../../generated/src/core/data/data/dependency/dependency_application.freezed.dart';

@freezed
class DependencyApplication with _$DependencyApplication {
  const factory DependencyApplication({
    required Locale locale,
    required ApplicationRouter router,
  }) = _DependencyApplication;
}
