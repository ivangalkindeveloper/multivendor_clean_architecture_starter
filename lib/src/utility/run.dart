import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_callback.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_steps.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/application/application.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/typedef.dart';
import 'package:mvs_utility/mvs_utility.dart';
import 'package:flutter/widgets.dart';

Future<void> run(
  IConfig config,
) =>
    MVSRunner.run(
      body:
          MVSInitializer<IConfig, InitializationProgress, InitializationResult>(
        config: config,
        progress: InitializationProgress(),
        steps: InitializationSteps.steps,
        callback: const InitializationCallback(),
        onSuccessRun: (
          InitializationResult result,
        ) =>
            Application(
          result: result,
        ),
        onErrorRun: (
          List<InitializationStep> steps,
          InitializationStep step,
          dynamic error,
          StackTrace stackTrace,
        ) =>
            const SizedBox(),
      ).initializeAndRun,
      onError: MVSLogger.logZoneError,
    );
