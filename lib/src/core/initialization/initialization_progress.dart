import 'package:dependency_initializer/dependency_initializer.dart';
import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/core/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/domain/interactor/fact_interactor.dart';
import 'package:multivendor_clean_architecture_starter/src/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/environment.dart';
import 'package:multivendor_clean_architecture_starter/src/repository/shared_repository.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: InitializationProgress
class InitializationProgress
    implements DependencyInitializationProcess<Dependency> {
  InitializationProgress({
    this.environment,
    this.httpClient,
    this.database,
    this.factApi,
    this.factRepository,
    this.factInteractor,
    this.theme,
    this.locale,
    this.router,
  });

  // Core
  Environment? environment;

  // Database
  MVSDatabase? database;
  MVSFactDao? factDao;
  MVSSharedStorage? sharedStorage;

  // Rest
  MVSHttpClient? httpClient;
  MVSFactApi? factApi;

  // Repository
  SharedRepository? sharedRepository;
  FactRepository? factRepository;

  // Domain
  FactInteractor? factInteractor;

  // Application
  MVSTheme? theme;
  Locale? locale;
  ApplicationRouter? router;

  @override
  Dependency toResult() => Dependency(
        environment: this.environment!,
        sharedRepository: this.sharedRepository!,
        factInteractor: this.factInteractor!,
        theme: this.theme!,
        locale: this.locale!,
        router: this.router!,
      );
}
