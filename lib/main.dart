import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:flutter/widgets.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/application/application.dart';
import 'package:multivendor_clean_architecture_starter/src/core/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/core/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/core/initialization/initialization_step_list.dart';
import 'package:mvs_utility/mvs_utility.dart';

Future<void> main() async => MVSRunner(
      body: DependencyInitializer<InitializationProgress, Dependency>(
        createProcess: () => InitializationProgress(),
        stepList: InitializationStepList.steps,
        onSuccess: (
          DependencyInitializationResult<InitializationProgress, Dependency>
              result,
          Duration duration,
        ) =>
            runApp(
          Application(
            dependency: result.result,
          ),
        ),
      ).run,
      onError: MVSLogger.logZoneError,
    ).run();
