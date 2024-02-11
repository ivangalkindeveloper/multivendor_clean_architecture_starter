import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/typedef.dart';
import 'package:mvs_utility/mvs_utility.dart';

//TODO Starter: InitializationCallback
class InitializationCallback
    extends IMVSInitializationCallback<InitializationStep, Dependency> {
  const InitializationCallback();

  @override
  void onStart(
    List<InitializationStep> steps,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Initialization start",
    );
    buffer.writeln(
      "Steps length [${steps.length}]\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
  }

  @override
  void onStepStart(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Start initialization step: [$index/${steps.length}] ${step.title}",
    );
    buffer.writeln(
      "Duration: ${duration.inMicroseconds}\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
  }

  @override
  void onStepSuccess(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  ) {
    final int index = steps.indexOf(step) + 1;
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Success initialization step: [$index/${steps.length}] ${step.title}",
    );
    buffer.writeln(
      "Duration: ${duration.inMicroseconds}\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
  }

  @override
  void onSuccess(
    Dependency result,
    Duration duration,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Initialization success",
    );
    buffer.writeln(
      "Duration: ${duration.inMicroseconds}\n",
    );
    MVSLogger.i(
      buffer.toString(),
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
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Initialization failed on the step: [$index/${steps.length}] ${step.title}.",
    );
    buffer.writeln(
      "Error: $error",
    );
    buffer.writeln(
      "StackTrace: $stackTrace \n",
    );
    MVSLogger.e(
      buffer.toString(),
    );
  }
}
