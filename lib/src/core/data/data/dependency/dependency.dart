import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_presentation.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/core/data/data/dependency/dependency.freezed.dart';

@freezed
class Dependency with _$Dependency {
  const factory Dependency({
    required DependencyData data,
    required DependencyPresentation presentation,
  }) = _Dependency;
}
