import 'package:multi_vendor_starter/src/presentation/router/application_router.dart';
import 'package:multi_vendor_starter/src/core/data/repository/fact_repository.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:multi_vendor_starter/src/core/data/client/api_clent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';

part '../../../../../generated/src/core/data/data/initialization/initialization_result.freezed.dart';

@freezed
class InitializationResult with _$InitializationResult {
  const factory InitializationResult({
    required IConfig config,
    required IApiClient apiClient,
    required Database database,
    required IFactRepository factRepository,
    required Locale locale,
    required ApplicationRouter router,
  }) = _InitializationResult;
}
