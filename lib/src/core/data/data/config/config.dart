import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';

abstract class IConfig {
  const IConfig();

  abstract final Environment environment;

  abstract final String baseUrl;
  abstract final String apiController;

  abstract final IFPCTheme themeLight;
  abstract final IFPCTheme themeDark;
}
