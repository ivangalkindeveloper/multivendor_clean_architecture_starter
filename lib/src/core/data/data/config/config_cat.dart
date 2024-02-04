part of 'config.dart';

class ConfigCat implements IConfig {
  const ConfigCat();

  @override
  final Environment environment = Environment.cat;
  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";
  @override
  final List<String> proxyUrls = const [];
  @override
  final String animalType = "cat";
  @override
  final String databaseName = "fact_cat_db";
}
