import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';

//TODO Starter: IConfig
abstract class IConfig {
  const IConfig();

  abstract final Environment environment;

  abstract final String baseUrl;

  abstract final String databaseName;

  abstract final String animalType;

  abstract final IFPCTheme themeLight;
  abstract final IFPCTheme themeDark;
}
