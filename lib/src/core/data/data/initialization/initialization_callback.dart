import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_step.dart';

abstract class IInitializationCallback {
  const IInitializationCallback();

  void onStart(
    List<InitializationStep> steps,
  );

  void onStepStart(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  );

  void onStepSuccess(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  );

  void onSuccess(
    InitializationResult result,
    Duration duration,
  );

  void onError(
    List<InitializationStep> steps,
    InitializationStep step,
    dynamic error,
    StackTrace stackTrace,
  );
}
