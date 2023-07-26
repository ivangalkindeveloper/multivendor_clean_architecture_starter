import 'package:multi_vendor_starter/src/core/data/repository/fact_repository.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/database.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:multi_vendor_starter/src/core/data/client/api_clent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/core/data/data/dependency/dependency_data.freezed.dart';

@freezed
class DependencyData with _$DependencyData {
  const factory DependencyData({
    required IConfig config,
    required IApiClient apiClient,
    required Database database,
    required IFactRepository factRepository,
  }) = _DependencyData;
}
