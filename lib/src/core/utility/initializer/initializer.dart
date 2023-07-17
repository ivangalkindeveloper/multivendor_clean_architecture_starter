import 'package:multi_vendor_starter/src/core/data/data/initialization/main/main_initialization_callback.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/main/main_initialization_steps.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_step.dart';
import 'package:multi_vendor_starter/src/presentation/application/application.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';
import 'package:flutter/widgets.dart';

class Initializer {
  const Initializer({
    required this.environment,
    required this.steps,
    this.callback,
    required this.onSuccessRun,
    this.onErrorRun,
  });

  factory Initializer.main({
    required Environment environment,
  }) =>
      Initializer(
        environment: environment,
        steps: MainInitializationSteps.steps,
        callback: const MainItializationCallback(),
        onSuccessRun: (InitializationResult result) => Application(
          result: result,
        ),
      );

  final Environment environment;
  final List<InitializationStep> steps;
  final MainItializationCallback? callback;
  final Widget Function(InitializationResult result) onSuccessRun;
  final Widget Function(
    List<InitializationStep> steps,
    InitializationStep step,
    dynamic error,
    StackTrace stackTrace,
  )? onErrorRun;

  Future<void> initializeAndRunApp() async {
    final Stopwatch stopwatch = Stopwatch()..start();
    final InitializationProgress progress = InitializationProgress();
    InitializationStep currentStep = steps.first;
    this.callback?.onStart(steps);

    try {
      for (InitializationStep step in this.steps) {
        final Stopwatch requestStopWatch = Stopwatch()..start();
        currentStep = step;
        await step.initialize(
          environment,
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
        runApp(this.onErrorRun!(
          steps,
          currentStep,
          error,
          stackTrace,
        ));
      }
      rethrow;
    }

    stopwatch.stop();
    final InitializationResult result = InitializationResult(
      config: progress.config!,
      apiClient: progress.apiClient!,
      applicationDatabase: progress.applicationDatabase!,
      catFactRepository: progress.catFactRepository!,
      locale: progress.locale!,
      router: progress.router!,
    );
    this.callback?.onSuccess(
          result,
          stopwatch.elapsed,
        );
    runApp(
      this.onSuccessRun(result),
    );
  }
}
