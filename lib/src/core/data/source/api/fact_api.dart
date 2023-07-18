import 'package:multi_vendor_starter/src/core/data/client/api_clent.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'package:dio/dio.dart';

abstract class IFactApi {
  Future<Fact> getRandomFact();

  Future<List<Fact>> getRandomFacts({
    required int amount,
  });
}

class FactApi implements IFactApi {
  const FactApi({
    required IConfig config,
    required IApiClient apiClient,
  })  : this._config = config,
        this._apiClient = apiClient;

  final IConfig _config;
  final IApiClient _apiClient;

  @override
  Future<Fact> getRandomFact() async {
    final Response response = await this._apiClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": this._config.animalType,
        "amount": 1,
      },
    );
    return Fact.fromJson(response.data);
  }

  @override
  Future<List<Fact>> getRandomFacts({
    required int amount,
  }) async {
    final Response response = await this._apiClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": this._config.animalType,
        "amount": amount,
      },
    );
    return List.from(
        (response.data as List).map((json) => Fact.fromJson(json)));
  }
}
