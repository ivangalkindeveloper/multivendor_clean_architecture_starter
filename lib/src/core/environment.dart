//TODO Starter: Environment
sealed class Environment {
  const Environment();

  abstract final String baseUrl;
  abstract final List<String> proxyUrls;
  abstract final String databaseName;
  abstract final String animalType;
}

final class Environment$Cat implements Environment {
  const Environment$Cat();

  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";
  @override
  final List<String> proxyUrls = const [];
  @override
  final String animalType = "cat";
  @override
  final String databaseName = "fact_cat_db";
}

final class Environment$Dog implements Environment {
  const Environment$Dog();

  @override
  final String baseUrl = "https://cat-fact.herokuapp.com";
  @override
  final List<String> proxyUrls = const [];
  @override
  final String animalType = "dog";
  @override
  final String databaseName = "fact_dog_db";
}
