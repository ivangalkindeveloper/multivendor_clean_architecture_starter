import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_callback.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_step.dart';
import 'package:multi_vendor_starter/src/core/utility/logger.dart';

class MainItializationCallback extends IInitializationCallback {
  const MainItializationCallback();

  @override
  void onStart(
    List<InitializationStep> steps,
  ) =>
      Logger.i(
        'Initialization start.'
        'Steps length [${steps.length}].',
      );

  @override
  void onStepStart(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step);
    Logger.i(
      'Start initialization step: [$index/${steps.length}] ${step.title}.'
      'Duration: ${duration.inMicroseconds}.',
    );
  }

  @override
  void onStepSuccess(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step);
    Logger.i(
      'Success initialization step: [$index/${steps.length}] ${step.title}.'
      'Duration: ${duration.inMicroseconds}.',
    );
  }

  @override
  void onSuccess(
    InitializationResult result,
    Duration duration,
  ) {
    Logger.i(
      'Initialization success.'
      'Duration: ${duration.inMicroseconds}.',
    );
  }

  @override
  void onError(
    List<InitializationStep> steps,
    InitializationStep step,
    dynamic error,
    StackTrace stackTrace,
  ) {
    final int index = steps.indexOf(step);
    Logger.e(
      'Initialization failed on the step: [$index/${steps.length}] ${step.title}.'
      'Error: $error'
      'StackTrace: $stackTrace',
    );
  }
}
