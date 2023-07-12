import 'package:multi_vendor_starter/src/presentation/component/theme/light/theme_light_vendor_two.dart';
import 'package:multi_vendor_starter/src/presentation/component/theme/dark/theme_dark_vendor_two.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';

class ConfigVendorTwo implements IConfig {
  ConfigVendorTwo();

  @override
  final Environment environment = Environment.vendorOne;

  @override
  final String baseUrl = "https://vendor-two.com";
  @override
  final String apiController = "/api/v1";

  @override
  final IFPCTheme themeLight = ThemeLightVendorTwo();
  @override
  final IFPCTheme themeDark = ThemeDarkVendorTwo();
}
