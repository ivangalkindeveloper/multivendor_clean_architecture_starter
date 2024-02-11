import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_application.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency_data.dart';
import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/dependency/dependency.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:mvs_utility/mvs_utility.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:mvs_rest/mvs_rest.dart';
import 'package:flutter/widgets.dart';

class InitializationProgress implements IMVSInitializationProgress<Dependency> {
  InitializationProgress({
    this.config,
    this.httpClient,
    this.database,
    this.factRepository,
    this.theme,
    this.locale,
    this.router,
  });

  IConfig? config;
  IMVSHTTPClient? httpClient;
  MVSDatabase? database;
  IFactRepository? factRepository;
  MVSTheme? theme;
  Locale? locale;
  ApplicationRouter? router;

  @override
  Dependency freeze() => Dependency(
        data: DependencyData(
          config: this.config!,
          httpClient: this.httpClient!,
          database: this.database!,
          factRepository: this.factRepository!,
        ),
        application: DependencyApplication(
          theme: this.theme!,
          locale: this.locale!,
          router: this.router!,
        ),
      );
}
