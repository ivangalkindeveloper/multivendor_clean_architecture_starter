import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_presentation.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/core/data/data/initialization/initialization_result.freezed.dart';

@freezed
class InitializationResult with _$InitializationResult {
  const factory InitializationResult({
    required DependencyData data,
    required DependencyPresentation presentation,
  }) = _InitializationResult;
}
