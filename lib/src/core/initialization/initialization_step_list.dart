import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:multivendor_clean_architecture_starter/src/core/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/observer/application_bloc_observer.dart';
import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/domain/interactor/fact_interactor.dart';
import 'package:multivendor_clean_architecture_starter/src/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/environment.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:multivendor_clean_architecture_starter/src/repository/shared_repository.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvs_utility/mvs_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:mvs_widget/mvs_widget.dart';

//TODO Starter: InitializationStepList
final class InitializationStepList {
  static final List<DependencyInitializationStep<InitializationProgress>>
      steps = [
    ..._framework,
    ..._core,
    ..._database,
    ..._rest,
    ..._repository,
    ..._bloc,
    ..._application,
  ];

  static final List<DependencyInitializationStep<InitializationProgress>>
      _framework = [
    InitializationStep<InitializationProgress>(
      title: "Framework",
      initialize: (
        InitializationProgress progress,
      ) {
        WidgetsFlutterBinding.ensureInitialized();
        FlutterError.onError = MVSLogger.logFlutterError;
        PlatformDispatcher.instance.onError =
            MVSLogger.logPlatformDispatcherError;
      },
    ),
  ];

  static final List<DependencyInitializationStep<InitializationProgress>>
      _core = [
    ReInitializationStep<InitializationProgress>(
      title: "Environment",
      initialize: (
        InitializationProgress progress,
      ) {
        final String environment = String.fromEnvironment("environment");
        switch (environment) {
          case "cat":
            progress.environment = const Environment$Cat();
          case "dog":
            progress.environment = const Environment$Dog();
          default:
            progress.environment = const Environment$Cat();
        }
      },
    ),
  ];

  static final List<DependencyInitializationStep<InitializationProgress>>
      _database = [
    ReInitializationStep<InitializationProgress>(
      title: "Database",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.database = MVSDatabase(
        databaseName: progress.environment!.databaseName,
      ),
    ),
    ReInitializationStep<InitializationProgress>(
      title: "FactDao",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.factDao = MVSFactDao(
        database: progress.database!,
      ),
    ),
    ReInitializationStep<InitializationProgress>(
      title: "SharedStorage",
      initialize: (
        InitializationProgress progress,
      ) async {
        progress.sharedStorage = MVSSharedStorage$();
        await progress.sharedStorage!.init();
      },
    ),
  ];

  static final List<DependencyInitializationStep<InitializationProgress>>
      _rest = [
    ReInitializationStep<InitializationProgress>(
      title: "HttpClient",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.httpClient = MVSHttpClient$(
        baseUrl: progress.environment!.baseUrl,
        proxyUrls: progress.environment!.proxyUrls,
        interceptors: const [
          MVSRequestInterceptor(),
        ],
      ),
    ),
    ReInitializationStep<InitializationProgress>(
      title: "FactApi",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.factApi = MVSFactApi$(
        httpClient: progress.httpClient!,
        animalType: progress.environment!.animalType,
      ),
    ),
  ];

  static final List<DependencyInitializationStep<InitializationProgress>>
      _repository = [
    ReInitializationStep<InitializationProgress>(
      title: "FactRepository",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.sharedRepository = SharedRepository$(
        sharedStorage: progress.sharedStorage!,
      ),
    ),
    ReInitializationStep<InitializationProgress>(
      title: "FactRepository",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.factRepository = FactRepository$(
        factApi: progress.factApi!,
        factDao: progress.factDao!,
      ),
    ),
    ReInitializationStep<InitializationProgress>(
      title: "FactInteractor",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.factInteractor = FactInteractor$(
        factRepository: progress.factRepository!,
      ),
    ),
  ];

  static final List<InitializationStep<InitializationProgress>> _bloc = [
    InitializationStep<InitializationProgress>(
      title: "BlocObserver",
      initialize: (
        InitializationProgress progress,
      ) {
        Bloc.observer = const ApplicationBlocObserver();
      },
    ),
  ];

  static final List<DependencyInitializationStep<InitializationProgress>>
      _application = [
    ReInitializationStep<InitializationProgress>(
      title: "Theme",
      initialize: (
        InitializationProgress progress,
      ) {
        switch (progress.environment) {
          case Environment$Cat() || null:
            progress.theme = MVSThemeCatLight();
          case Environment$Dog():
            progress.theme = MVSThemeDogLight();
        }
      },
    ),
    ReInitializationStep<InitializationProgress>(
      title: "Locale",
      initialize: (
        InitializationProgress progress,
      ) {
        final Locale platformLocale = Locale(Platform.localeName);
        if (L10N.supportedLocales.contains(platformLocale)) {
          progress.locale = platformLocale;
        } else {
          progress.locale = const Locale(
            "en",
            "US",
          );
        }
      },
    ),
    ReInitializationStep<InitializationProgress>(
      title: "Router",
      initialize: (
        InitializationProgress progress,
      ) =>
          progress.router = ApplicationRouter(),
    ),
  ];
}
