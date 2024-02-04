import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/application/application_bloc_observer.dart';
import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/utility/typedef.dart';
import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvs_utility/mvs_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:mvs_widget/mvs_widget.dart';

//TODO Starter: MainInitializationSteps
class InitializationStepList {
  static final List<InitializationStep> steps = [
    ..._framework,
    ..._data,
    ..._bloc,
    ..._application,
  ];

  static final List<InitializationStep> _framework = [
    MVSInitializationStep(
      title: "Framework",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) {
        WidgetsFlutterBinding.ensureInitialized();
        FlutterError.onError = MVSLogger.logFlutterError;
        PlatformDispatcher.instance.onError =
            MVSLogger.logPlatformDispatcherError;
        Bloc.observer = const ApplicationBlocObserver();
      },
    ),
  ];

  static final List<InitializationStep> _data = [
    MVSInitializationStep(
      title: "Config",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) {
        progress.config = config;
      },
    ),
    MVSInitializationStep(
      title: "HttpClient",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) =>
          progress.httpClient = MVSHttpClient(
        baseUrl: progress.config!.baseUrl,
        interceptors: const [
          MVSRequestInterceptor(),
        ],
      ),
    ),
    MVSInitializationStep(
      title: "Database",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) =>
          progress.database = MVSDatabase(
        databaseName: progress.config!.databaseName,
      ),
    ),
    MVSInitializationStep(
      title: "FactRepository",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) =>
          progress.factRepository = FactRepository(
        factApi: MVSFactApi(
          httpClient: progress.httpClient!,
          animalType: progress.config!.animalType,
        ),
        factDao: MVSFactDao(
          database: progress.database!,
        ),
      ),
    ),
  ];

  static final List<InitializationStep> _bloc = [
    MVSInitializationStep(
      title: "BlocObserver",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) {
        Bloc.observer = const ApplicationBlocObserver();
      },
    ),
  ];

  static final List<InitializationStep> _application = [
    MVSInitializationStep(
      title: "Theme",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) {
        switch (config.environment) {
          case Environment.cat:
            progress.theme = MVSThemeCatLight();
          case Environment.dog:
            progress.theme = MVSThemeDogLight();
        }
      },
    ),
    MVSInitializationStep(
      title: "Locale",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) {
        final Locale platformLocale = Locale(Platform.localeName);
        if (ApplicationLocalization.supportedLocales.contains(platformLocale)) {
          progress.locale = platformLocale;
        } else {
          progress.locale = const Locale("en", "US");
        }
      },
    ),
    MVSInitializationStep(
      title: "Router",
      initialize: (
        IConfig config,
        InitializationProgress progress,
      ) =>
          progress.router = ApplicationRouter(),
    ),
  ];
}
