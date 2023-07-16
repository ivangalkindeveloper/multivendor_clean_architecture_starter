import 'package:multi_vendor_starter/src/core/data/source/data_base/cat_fact_store.dart';
import 'package:multi_vendor_starter/src/core/data/source/api/cat_fact_api.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'dart:async';

abstract class ICatFactRepository {
  const ICatFactRepository();

  Future<CatFact> getOneRandomCatFact();

  Future<void> setCatFact({
    required CatFact catFact,
  });

  Future<CatFact?> getCatFact();
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
  Future<CatFact> getOneRandomCatFact() => this._catFactApi.getRandomCatFacts(
        amount: 1,
      );

  @override
  Future<void> setCatFact({
    required CatFact catFact,
  }) =>
      this._catFactStore.set(
            catFact: catFact,
          );

  @override
  Future<CatFact?> getCatFact() => this._catFactStore.get();
}
