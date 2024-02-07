import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact_bo.dart';

//TODO Starter: IInteractor
abstract class IFactInteractor {
  const IFactInteractor();

  Future<FactBO?> getLast();

  Future<FactBO> getRandom();

  Future<void> save({
    required FactBO fact,
  });
}

class FactInteractor implements IFactInteractor {
  const FactInteractor({
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<FactBO?> getLast() => this.factRepository.getLastFact();

  @override
  Future<FactBO> getRandom() => this.factRepository.getOneRandomFact();

  @override
  Future<void> save({
    required FactBO fact,
  }) =>
      this.factRepository.insertFact(
            fact: fact,
          );
}
