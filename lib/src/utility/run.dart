import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_step_list.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_callback.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/application/application.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/typedef.dart';
import 'package:mvs_utility/mvs_utility.dart';
import 'package:flutter/widgets.dart';

Future<void> run({
  required IConfig config,
}) =>
    MVSRunner.run(
      body: MVSInitializer<IConfig, InitializationProgress, Dependency>(
        config: config,
        progress: InitializationProgress(),
        steps: InitializationStepList.steps,
        callback: const InitializationCallback(),
        onSuccessRun: (
          Dependency result,
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
