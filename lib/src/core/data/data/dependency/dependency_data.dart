import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:mvs_database/mvs_database.dart';
import 'package:mvs_rest/mvs_rest.dart';

class DependencyData {
  const DependencyData({
    required this.config,
    required this.httpClient,
    required this.database,
    required this.factRepository,
  });

  final IConfig config;
  final IMVSHttpClient httpClient;
  final MVSDatabase database;
  final IFactRepository factRepository;
}
