import 'package:multi_vendor_starter/src/presentation/component/theme/light/theme_light_vendor_one.dart';
import 'package:multi_vendor_starter/src/presentation/component/theme/dark/theme_dark_vendor_one.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment.dart';

class ConfigVendorOne implements IConfig {
  ConfigVendorOne();

  @override
  final Environment environment = Environment.vendorOne;

  @override
  final String baseUrl = "https://vendor-one.com";
  @override
  final String apiController = "/api/v1";

  @override
  final IFPCTheme themeLight = ThemeLightVendorOne();
  @override
  final IFPCTheme themeDark = ThemeDarkVendorOne();
}
