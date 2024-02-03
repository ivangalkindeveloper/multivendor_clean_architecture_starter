import 'package:mvs_rest/mvs_rest.dart';
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
    required IMVSHttpClient httpClient,
    required String animalType,
  })  : this._httpClient = httpClient,
        this._animalType = animalType;

  final IMVSHttpClient _httpClient;
  final String _animalType;

  @override
  Future<FactDto> getRandomFact() async {
    final Response response = await this._httpClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": this._animalType,
        "amount": 1,
      },
    );
    return FactDto.fromJson(
      response.data,
    );
  }

  @override
  Future<List<FactDto>> getRandomFacts({
    required int amount,
  }) async {
    final Response response = await this._httpClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": this._animalType,
        "amount": amount,
      },
    );
    return List.from(
      (response.data as List).map(
        (
          json,
        ) =>
            FactDto.fromJson(
          json,
        ),
      ),
    );
  }
}
