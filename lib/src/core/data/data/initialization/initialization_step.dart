import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

part '../../../../../generated/src/core/data/data/initialization/initialization_step.freezed.dart';

@freezed
class InitializationStep with _$InitializationStep {
  const factory InitializationStep({
    required String title,
    required FutureOr<void> Function(
      Environment environment,
      InitializationProgress progress,
    ) initialize,
  }) = _InitializationStep;
}
