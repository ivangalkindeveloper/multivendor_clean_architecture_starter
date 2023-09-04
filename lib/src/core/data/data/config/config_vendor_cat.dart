import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/theme/light/theme_light_vendor_cat.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/theme/dark/theme_dark_vendor_cat.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';

class ConfigVendorCat implements IConfig {
  ConfigVendorCat();

  @override
  final Environment environment = Environment.vendorCat;

  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";

  @override
  final String animalType = "cat";

  @override
  final String databaseName = "fact_cat_db";

  @override
  final IFPCTheme themeLight = ThemeLightVendorCat();
  @override
  final IFPCTheme themeDark = ThemeDarkVendorCat();
}
