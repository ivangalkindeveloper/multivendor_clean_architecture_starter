import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'package:multi_vendor_starter/src/core/data/client/api_clent.dart';
import 'package:dio/dio.dart';

class CatFactApi {
  const CatFactApi({
    required IApiClient apiClient,
  }) : this._apiClient = apiClient;

  final IApiClient _apiClient;

  Future<CatFact> getRandomCatFact() async {
    final Response response = await this._apiClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": "cat",
        "amount": 1,
      },
    );
    return CatFact.fromJson(response.data);
  }

  Future<List<CatFact>> getRandomCatFacts({required int amount}) async {
    final Response response = await this._apiClient.get(
      endpoint: "/facts/random",
      queryParameters: {
        "animal_type": "cat",
        "amount": amount,
      },
    );
    return List.from(
        (response.data as List).map((json) => CatFact.fromJson(json)));
  }
}
