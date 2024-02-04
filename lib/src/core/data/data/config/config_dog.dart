part of 'config.dart';

class ConfigDog implements IConfig {
  const ConfigDog();

  @override
  final Environment environment = Environment.dog;
  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";
  @override
  final String animalType = "dog";
  @override
  final String databaseName = "fact_dog_db";
}
