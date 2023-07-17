import 'package:multi_vendor_starter/src/core/data/source/database/application_database.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/cat_fact_api.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'dart:async';

abstract class ICatFactRepository {
  const ICatFactRepository();

  Future<CatFact> getOneRandomCatFact();

  Future<void> insertCatFact({
    required CatFact catFact,
  });

  Future<CatFact?> getCatFact();
}

class CatFactRepository implements ICatFactRepository {
  const CatFactRepository({
    required CatFactApi catFactApi,
    required ApplicationDatabase applicationDatabase,
  })  : this._catFactApi = catFactApi,
        this._applicationDatabase = applicationDatabase;

  final CatFactApi _catFactApi;
  final ApplicationDatabase _applicationDatabase;

  @override
  Future<CatFact> getOneRandomCatFact() => this._catFactApi.getRandomCatFact();

  @override
  Future<void> insertCatFact({
    required CatFact catFact,
  }) =>
      this._applicationDatabase.updateCatFact(
            companion: CatFactDatabaseTableCompanion.insert(
              factId: catFact.id,
              description: catFact.description,
            ),
          );

  @override
  Future<CatFact?> getCatFact() async {
    final List<CatFactDatabase> catFactsDatabase =
        await this._applicationDatabase.getCatFacts();
    final CatFactDatabase catFactDatabase = catFactsDatabase.first;

    return CatFact(
      id: catFactDatabase.factId,
      description: catFactDatabase.description,
    );
  }
}
