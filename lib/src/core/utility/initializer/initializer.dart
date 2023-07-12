import 'package:multi_vendor_starter/src/core/data/data/initialization/main_initialization_steps.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_step.dart';
import 'package:multi_vendor_starter/src/presentation/application/application.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';
import 'package:multi_vendor_starter/src/core/utility/logger.dart';
import 'package:flutter/widgets.dart';

class Initializer {
  const Initializer({
    required this.environment,
    required this.steps,
    this.onStart,
    this.onStepSuccess,
    this.onSuccess,
    this.onError,
  });

  factory Initializer.main({
    required Environment environment,
  }) =>
      Initializer(
        environment: environment,
        steps: MainInitializationSteps.steps,
        onStart: (
          List<InitializationStep> steps,
        ) =>
            Logger.i(
          'Initialization start.'
          'Steps length [${steps.length}].',
        ),
        onStepSuccess: (
          List<InitializationStep> steps,
          InitializationStep step,
          Duration duration,
        ) {
          final int index = steps.indexOf(step);
          Logger.i(
            'Success initialization step: [$index/${steps.length}] ${step.title}.'
            'Duration: ${duration.inMicroseconds}.',
          );
        },
        onSuccess: (
          InitializationResult result,
          Duration duration,
        ) {
          Logger.i(
            'Initialization success.'
            'Duration: ${duration.inMicroseconds}.',
          );

          runApp(
            Application(
              result: result,
            ),
          );
        },
        onError: (
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
        },
      );

  final Environment environment;
  final List<InitializationStep> steps;

  final void Function(
    List<InitializationStep> steps,
  )? onStart;

  final void Function(
    List<InitializationStep> steps,
    InitializationStep step,
    Duration duration,
  )? onStepSuccess;

  final void Function(
    InitializationResult result,
    Duration duration,
  )? onSuccess;

  final void Function(
    List<InitializationStep> steps,
    InitializationStep step,
    dynamic error,
    StackTrace stackTrace,
  )? onError;

  Future<void> initializeAndRunApp() async {
    final Stopwatch stopwatch = Stopwatch()..start();
    final InitializationProgress progress = InitializationProgress();
    InitializationStep currentStep = steps.first;
    this.onStart?.call(steps);

    try {
      for (InitializationStep step in this.steps) {
        final Stopwatch requestStopWatch = Stopwatch()..start();
        currentStep = step;
        await step.initialize(
          environment,
          progress,
        );
        requestStopWatch.stop();
        this.onStepSuccess?.call(
              this.steps,
              step,
              requestStopWatch.elapsed,
            );
      }
    } catch (error, stackTrace) {
      this.onError?.call(
            steps,
            currentStep,
            error,
            stackTrace,
          );
      rethrow;
    }

    stopwatch.stop();
    this.onSuccess?.call(
          InitializationResult(
            config: progress.config!,
            apiClient: progress.apiClient!,
            repository: progress.repository!,
            locale: progress.locale!,
            router: progress.router!,
          ),
          stopwatch.elapsed,
        );
  }
}
