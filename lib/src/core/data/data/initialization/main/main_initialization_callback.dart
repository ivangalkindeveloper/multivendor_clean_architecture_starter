import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_callback.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_step.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/logger/logger.dart';

//TODO Starter: MainItializationCallback
class MainItializationCallback extends IInitializationCallback {
  const MainItializationCallback();

  @override
  void onStart(
    List<InitializationStep> steps,
  ) {
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Initialization start')
      ..writeln('Steps length [${steps.length}].');
    Logger.i(stringBuffer.toString());
  }

  @override
  void onStepStart(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln(
          'Start initialization step: [$index/${steps.length}] ${step.title}.')
      ..writeln('Duration: ${duration.inMicroseconds}.');
    Logger.i(stringBuffer.toString());
  }

  @override
  void onStepSuccess(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln(
          'Success initialization step: [$index/${steps.length}] ${step.title}.')
      ..writeln('Duration: ${duration.inMicroseconds}.');
    Logger.i(stringBuffer.toString());
  }

  @override
  void onSuccess(
    InitializationResult result,
    Duration duration,
  ) {
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Initialization success.')
      ..writeln('Duration: ${duration.inMicroseconds}.');
    Logger.i(stringBuffer.toString());
  }

  @override
  void onError(
    List<InitializationStep> steps,
    InitializationStep step,
    dynamic error,
    StackTrace stackTrace,
  ) {
    final int index = steps.indexOf(step);
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln(
          'Initialization failed on the step: [$index/${steps.length}] ${step.title}.')
      ..writeln('Error: $error')
      ..writeln('StackTrace: $stackTrace');
    Logger.i(stringBuffer.toString());
  }
}
