import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact_bo.dart';
import 'dart:async';

//TODO Starter: IInteractor
abstract class IFactInteractor {
  const IFactInteractor();

  FutureOr<FactBO?> getLast();

  FutureOr<FactBO> getRandom();

  FutureOr<void> save({
    required FactBO fact,
  });
}

class FactInteractor implements IFactInteractor {
  const FactInteractor({
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<FactBO?> getLast() async => this.factRepository.getLastFact();

  @override
  Future<FactBO> getRandom() async => this.factRepository.getOneRandomFact();

  @override
  Future<void> save({
    required FactBO fact,
  }) async =>
      this.factRepository.insertFact(
            fact: fact,
          );
}
