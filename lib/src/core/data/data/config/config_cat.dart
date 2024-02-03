part of 'config.dart';

class ConfigCat implements IConfig {
  ConfigCat();

  @override
  final Environment environment = Environment.cat;

  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";

  @override
  final String animalType = "cat";

  @override
  final String databaseName = "fact_cat_db";

  @override
  final FPCTheme themeLight = ThemeCatLight();
  @override
  final FPCTheme themeDark = ThemeCatDark();
}
