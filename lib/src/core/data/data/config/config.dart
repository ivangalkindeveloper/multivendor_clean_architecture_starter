import 'package:multivendor_clean_architecture_starter/src/core/data/data/environment/environment.dart';

part 'config_cat.dart';
part 'config_dog.dart';

//TODO Starter: IConfig
sealed class IConfig {
  const IConfig();

  abstract final Environment environment;
  abstract final String baseUrl;
  abstract final String databaseName;
  abstract final String animalType;
}
