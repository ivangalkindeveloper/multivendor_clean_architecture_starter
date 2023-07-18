import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';

abstract class IFactInteractor {
  const IFactInteractor();

  Future<Fact?> getLast();

  Future<Fact> getRandom();

  Future<void> save({
    required Fact fact,
  });

  Future<void> update({
    required Fact fact,
  });
}

class FactInteractor implements IFactInteractor {
  const FactInteractor({
    required this.catFactRepository,
  });

  final IFactRepository catFactRepository;

  @override
  Future<Fact?> getLast() => this.catFactRepository.getLastFact();

  @override
  Future<Fact> getRandom() => this.catFactRepository.getOneRandomFact();

  @override
  Future<void> save({
    required Fact fact,
  }) =>
      this.catFactRepository.insertNewFact(
            fact: fact,
          );

  @override
  Future<void> update({
    required Fact fact,
  }) =>
      this.catFactRepository.updateFact(
            fact: fact,
          );
}
