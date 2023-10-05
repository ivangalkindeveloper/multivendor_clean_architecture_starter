import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data_source/database/database.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/client/http_clent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';

part '../../../../../generated/src/core/data/data/initialization/initialization_progress.freezed.dart';

@unfreezed
class InitializationProgress with _$InitializationProgress {
  factory InitializationProgress({
    IConfig? config,
    IHttpClient? httpClient,
    Database? database,
    IFactRepository? factRepository,
    Locale? locale,
    ApplicationRouter? router,
  }) = _InitializationProgress;
}
