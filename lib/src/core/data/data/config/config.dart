import 'package:multi_vendor_starter/src/core/data/data/environment/environment.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';

abstract class IConfig {
  const IConfig();

  abstract final Environment environment;

  abstract final String baseUrl;

  abstract final String animalType;

  abstract final IFPCTheme themeLight;
  abstract final IFPCTheme themeDark;
}
