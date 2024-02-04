import 'package:mvs_utility/mvs_utility.dart';
import 'package:flutter/widgets.dart';

abstract class IMVSInitializer {
  Future<void> initializeAndRun();
}

class MVSInitializer<
    Config,
    Progress extends IMVSInitializationProgress<Result>,
    Result> implements IMVSInitializer {
  const MVSInitializer({
    required this.config,
    required this.progress,
    required this.steps,
    this.callback,
    required this.onSuccessRun,
    this.onErrorRun,
  });

  final Config config;
  final Progress progress;
  final List<MVSInitializationStep<Config, Progress>> steps;
  final IMVSInitializationCallback<MVSInitializationStep<Config, Progress>,
      Result>? callback;
  final Widget Function(Result result) onSuccessRun;
  final Widget Function(
    List<MVSInitializationStep<Config, Progress>> steps,
    MVSInitializationStep<Config, Progress> step,
    dynamic error,
    StackTrace stackTrace,
  )? onErrorRun;

  @override
  Future<void> initializeAndRun() async {
    final Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    MVSInitializationStep<Config, Progress> currentStep = steps.first;
    this.callback?.onStart(steps);

    try {
      for (final MVSInitializationStep<Config, Progress> step in this.steps) {
        final Stopwatch requestStopWatch = Stopwatch();
        requestStopWatch.start();
        currentStep = step;
        await step.initialize(
          config,
          progress,
        );
        requestStopWatch.stop();
        this.callback?.onStepSuccess(
              this.steps,
              step,
              requestStopWatch.elapsed,
            );
      }
    } catch (error, stackTrace) {
      this.callback?.onError(
            steps,
            currentStep,
            error,
            stackTrace,
          );
      if (this.onErrorRun != null) {
        runApp(
          this.onErrorRun!(
            steps,
            currentStep,
            error,
            stackTrace,
          ),
        );
      }
      rethrow;
    }

    stopwatch.stop();
    final Result result = progress.freeze();
    this.callback?.onSuccess(
          result,
          stopwatch.elapsed,
        );
    runApp(
      this.onSuccessRun(
        result,
      ),
    );
  }
}
