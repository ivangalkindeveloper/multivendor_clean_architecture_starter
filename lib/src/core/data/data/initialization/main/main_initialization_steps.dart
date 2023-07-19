import 'package:multi_vendor_starter/src/presentation/application/bloc/application_bloc_observer.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multi_vendor_starter/src/core/data/data/initialization/initialization_step.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/storage/fact_storage.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config_vendor_cat.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config_vendor_dog.dart';
import 'package:multi_vendor_starter/src/presentation/router/application_router.dart';
import 'package:multi_vendor_starter/src/core/data/repository/fact_repository.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/fact_api.dart';
import 'package:multi_vendor_starter/src/core/data/client/api_clent.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';
import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:multi_vendor_starter/src/core/utility/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

class MainInitializationSteps {
  static final List<InitializationStep> steps = [
    ..._framework,
    ..._data,
    ..._domain,
    ..._presentation,
  ];

  static final List<InitializationStep> _framework = [
    InitializationStep(
      title: "Framework",
      initialize: (
        Environment environment,
        InitializationProgress progress,
      ) {
        WidgetsFlutterBinding.ensureInitialized();
        FlutterError.onError = Logger.logFlutterError;
        PlatformDispatcher.instance.onError = Logger.logPlatformDispatcherError;
        Bloc.observer = const ApplicationBlocObserver();
      },
    ),
  ];

  static final List<InitializationStep> _data = [
    InitializationStep(
      title: "Config",
      initialize: (
        Environment environment,
        InitializationProgress progress,
      ) {
        switch (environment) {
          case Environment.vendorCat:
            progress.config = ConfigVendorCat();
          case Environment.vendorDog:
            progress.config = ConfigVendorDog();
        }
      },
    ),
    InitializationStep(
      title: "ApiClient",
      initialize: (
        Environment environment,
        InitializationProgress progress,
      ) =>
          progress.apiClient = ApiClient(
        config: progress.config!,
      ),
    ),
    InitializationStep(
      title: "Database",
      initialize: (
        Environment environment,
        InitializationProgress progress,
      ) =>
          progress.database = Database(),
    ),
    InitializationStep(
      title: "FactRepository",
      initialize: (
        Environment environment,
        InitializationProgress progress,
      ) =>
          progress.factRepository = FactRepository(
        factApi: FactApi(
          config: progress.config!,
          apiClient: progress.apiClient!,
        ),
        factStorage: FactStorage(
          database: progress.database!,
        ),
      ),
    ),
  ];

  static final List<InitializationStep> _domain = [];

  static final List<InitializationStep> _presentation = [
    InitializationStep(
      title: "Locale",
      initialize: (
        Environment environment,
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
    InitializationStep(
      title: "Router",
      initialize: (
        Environment environment,
        InitializationProgress progress,
      ) =>
          progress.router = ApplicationRouter(),
    ),
  ];
}
