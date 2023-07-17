import 'package:multi_vendor_starter/src/core/data/source/database/application_database.dart';
import 'package:multi_vendor_starter/src/core/data/source/database/store/cat_fact_store.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/cat_fact_api.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'dart:async';

abstract class ICatFactRepository {
  const ICatFactRepository();

  Future<CatFact> getOneRandomCatFact();

  Future<CatFact?> getCatFact();

  Future<void> insertCatFact({
    required CatFact catFact,
  });

  Future<void> updateCatFact({
    required CatFact catFact,
  });
}

class CatFactRepository implements ICatFactRepository {
  const CatFactRepository({
    required CatFactApi catFactApi,
    required CatFactStore catFactStore,
  })  : this._catFactApi = catFactApi,
        this._catFactStore = catFactStore;

  final CatFactApi _catFactApi;
  final CatFactStore _catFactStore;

  @override
  Future<CatFact> getOneRandomCatFact() => this._catFactApi.getRandomCatFact();

  @override
  Future<CatFact?> getCatFact() async {
    final List<CatFactDatabase> catFactsDatabase =
        await this._catFactStore.getCatFacts();
    if (catFactsDatabase.isEmpty) {
      return null;
    }

    final CatFactDatabase catFactDatabase = catFactsDatabase.first;

    return CatFact(
      id: catFactDatabase.factId,
      description: catFactDatabase.description,
    );
  }

  @override
  Future<void> insertCatFact({
    required CatFact catFact,
  }) =>
      this._catFactStore.insertCatFact(
            companion: CatFactDatabaseTableCompanion.insert(
              factId: catFact.id,
              description: catFact.description,
            ),
          );

  @override
  Future<void> updateCatFact({
    required CatFact catFact,
  }) =>
      this._catFactStore.updateCatFact(
            companion: CatFactDatabaseTableCompanion.insert(
              factId: catFact.id,
              description: catFact.description,
            ),
          );
}
