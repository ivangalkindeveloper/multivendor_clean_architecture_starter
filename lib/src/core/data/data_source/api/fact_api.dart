import 'package:multivendor_clean_architecture_starter/src/core/data/data/dto/fact/fact_dto.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/client/http_clent.dart';
import 'package:dio/dio.dart';

//TODO Starter: IApi
abstract class IFactApi {
  Future<FactDto> getRandomFact();

  Future<List<FactDto>> getRandomFacts({
    required int amount,
  });
}

class FactApi implements IFactApi {
  const FactApi({
    required IConfig config,
    required IHttpClient httpClient,
  })  : this._config = config,
        this._httpClient = httpClient;

  final IConfig _config;
  final IHttpClient _httpClient;

  @override
  Future<FactDto> getRandomFact() async {
    final Response response = await this._httpClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": this._config.animalType,
        "amount": 1,
      },
    );
    return FactDto.fromJson(response.data);
  }

  @override
  Future<List<FactDto>> getRandomFacts({
    required int amount,
  }) async {
    final Response response = await this._httpClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": this._config.animalType,
        "amount": amount,
      },
    );
    return List.from(
        (response.data as List).map((json) => FactDto.fromJson(json)));
  }
}
