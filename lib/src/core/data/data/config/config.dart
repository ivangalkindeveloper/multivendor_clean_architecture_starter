import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/theme/light/theme_cat_light.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/theme/light/theme_dog_light.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/theme/dark/theme_cat_dark.dart';
import 'package:multivendor_clean_architecture_starter/src/application/widget/component/entity/theme/dark/theme_dog_dark.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';
import 'package:flutter_platform_component/flutter_platform_component.dart';

part 'config_cat.dart';
part 'config_dog.dart';

//TODO Starter: IConfig
sealed class IConfig {
  const IConfig();

  abstract final Environment environment;

  abstract final String baseUrl;

  abstract final String databaseName;

  abstract final String animalType;

  abstract final FPCTheme themeLight;
  abstract final FPCTheme themeDark;
}
