import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/typedef.dart';
import 'package:mvs_utility/mvs_utility.dart';

//TODO Starter: InitializationCallback
class InitializationCallback extends IMVSInitializationCallback<
    InitializationStep, InitializationResult> {
  const InitializationCallback();

  @override
  void onStart(
    List<InitializationStep> steps,
  ) {
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln(
      'Initialization start',
    );
    stringBuffer.writeln(
      'Steps length [${steps.length}]\n',
    );
    MVSLogger.i(
      stringBuffer.toString(),
    );
  }

  @override
  void onStepStart(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln(
      'Start initialization step: [$index/${steps.length}] ${step.title}',
    );
    stringBuffer.writeln(
      'Duration: ${duration.inMicroseconds}\n',
    );
    MVSLogger.i(
      stringBuffer.toString(),
    );
  }

  @override
  void onStepSuccess(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln(
      'Success initialization step: [$index/${steps.length}] ${step.title}',
    );
    stringBuffer.writeln(
      'Duration: ${duration.inMicroseconds}\n',
    );
    MVSLogger.i(
      stringBuffer.toString(),
    );
  }

  @override
  void onSuccess(
    InitializationResult result,
    Duration duration,
  ) {
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln(
      'Initialization success',
    );
    stringBuffer.writeln(
      'Duration: ${duration.inMicroseconds}\n',
    );
    MVSLogger.i(
      stringBuffer.toString(),
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
    final StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeln(
      'Initialization failed on the step: [$index/${steps.length}] ${step.title}.',
    );
    stringBuffer.writeln(
      'Error: $error',
    );
    stringBuffer.writeln(
      'StackTrace: $stackTrace \n',
    );
    MVSLogger.e(
      stringBuffer.toString(),
    );
  }
}
