import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact.dart';

//TODO Starter: IInteractor
abstract class IFactInteractor {
  const IFactInteractor();

  Future<Fact?> getLast();

  Future<Fact> getRandom();

  Future<void> save({
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
      this.catFactRepository.insertFact(
            fact: fact,
          );
}
