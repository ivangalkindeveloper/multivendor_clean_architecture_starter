import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_result.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_application.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_data.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data_source/database/database.dart';
import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:mvs_utility/mvs_utility.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'package:flutter/widgets.dart';

class InitializationProgress
    implements IMVSInitializationProgress<InitializationResult> {
  InitializationProgress({
    this.config,
    this.httpClient,
    this.database,
    this.factRepository,
    this.locale,
    this.router,
  });

  IConfig? config;
  IMVSHttpClient? httpClient;
  Database? database;
  IFactRepository? factRepository;
  Locale? locale;
  ApplicationRouter? router;

  @override
  InitializationResult freeze() => InitializationResult(
        data: DependencyData(
          config: this.config!,
          httpClient: this.httpClient!,
          database: this.database!,
          factRepository: this.factRepository!,
        ),
        application: DependencyApplication(
          locale: this.locale!,
          router: this.router!,
        ),
      );
}
