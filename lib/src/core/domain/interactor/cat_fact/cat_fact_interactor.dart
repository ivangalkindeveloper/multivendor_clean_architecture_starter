import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';

abstract class ICatFactInteractor {
  const ICatFactInteractor();

  Future<CatFact?> getLast();

  Future<CatFact> getRandom();

  Future<void> save({
    required CatFact catFact,
  });

  Future<void> update({
    required CatFact catFact,
  });
}

class CatFactInteractor implements ICatFactInteractor {
  const CatFactInteractor({
    required this.catFactRepository,
  });

  final ICatFactRepository catFactRepository;

  @override
  Future<CatFact?> getLast() => this.catFactRepository.getCatFact();

  @override
  Future<CatFact> getRandom() => this.catFactRepository.getOneRandomCatFact();

  @override
  Future<void> save({
    required CatFact catFact,
  }) =>
      this.catFactRepository.insertCatFact(
            catFact: catFact,
          );

  @override
  Future<void> update({
    required CatFact catFact,
  }) =>
      this.catFactRepository.updateCatFact(
            catFact: catFact,
          );
}
