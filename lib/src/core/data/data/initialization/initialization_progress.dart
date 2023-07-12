import 'package:multi_vendor_starter/src/presentation/router/application_router.dart';
import 'package:multi_vendor_starter/src/core/data/data/repository/repository.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:multi_vendor_starter/src/core/data/client/api_clent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/widgets.dart';

part '../../../../../generated/src/core/data/data/initialization/initialization_progress.freezed.dart';

@unfreezed
class InitializationProgress with _$InitializationProgress {
  factory InitializationProgress({
    IConfig? config,
    IApiClient? apiClient,
    IRepository? repository,
    Locale? locale,
    ApplicationRouter? router,
  }) = _InitializationProgress;
}
