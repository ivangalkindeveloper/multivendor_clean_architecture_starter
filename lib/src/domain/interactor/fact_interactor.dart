import 'package:multivendor_clean_architecture_starter/src/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/domain/entity/fact.dart';
import 'dart:async';

//TODO Starter: FactInteractor
abstract interface class FactInteractor {
  const FactInteractor();

  FutureOr<Fact?> getLast();

  FutureOr<Fact> getRandom();

  FutureOr<void> save({
    required Fact fact,
  });
}

class FactInteractor$ implements FactInteractor {
  const FactInteractor$({
    required this.factRepository,
  });

  final FactRepository factRepository;

  @override
  Future<Fact?> getLast() async => this.factRepository.getLastFact();

  @override
  Future<Fact> getRandom() async => this.factRepository.getOneRandomFact();

  @override
  Future<void> save({
    required Fact fact,
  }) async =>
      this.factRepository.insertFact(
            fact: fact,
          );
}
