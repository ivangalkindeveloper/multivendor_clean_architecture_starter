import 'package:multi_vendor_starter/src/presentation/component/theme/light/theme_light_vendor_dog.dart';
import 'package:multi_vendor_starter/src/presentation/component/theme/dark/theme_dark_vendor_dog.dart';
import 'package:multi_vendor_starter/src/core/data/data/environment/environment.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';

class ConfigVendorDog implements IConfig {
  ConfigVendorDog();

  @override
  final Environment environment = Environment.vendorDog;

  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";

  @override
  final String animalType = "dog";

  @override
  final IFPCTheme themeLight = ThemeLightVendorDog();
  @override
  final IFPCTheme themeDark = ThemeDarkVendorDog();
}
