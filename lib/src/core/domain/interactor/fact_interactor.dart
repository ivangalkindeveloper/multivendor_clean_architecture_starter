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
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<Fact?> getLast() => this.factRepository.getLastFact();

  @override
  Future<Fact> getRandom() => this.factRepository.getOneRandomFact();

  @override
  Future<void> save({
    required Fact fact,
  }) =>
      this.factRepository.insertFact(
            fact: fact,
          );
}
