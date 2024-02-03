import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data_source/database/database.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/client/http_clent.dart';

class DependencyData {
  const DependencyData({
    required this.config,
    required this.httpClient,
    required this.database,
    required this.factRepository,
  });

  final IConfig config;
  final IHttpClient httpClient;
  final Database database;
  final IFactRepository factRepository;
}
