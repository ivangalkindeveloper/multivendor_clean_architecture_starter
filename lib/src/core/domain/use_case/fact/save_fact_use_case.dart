import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact.dart';
import 'dart:async';

//TODO Starter: UseCase
abstract class ISaveFactUseCase {
  Future<void> execute({
    required Fact fact,
  });
}

class SaveFactUseCase implements ISaveFactUseCase {
  const SaveFactUseCase({
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<void> execute({
    required Fact fact,
  }) =>
      this.factRepository.insertFact(
            fact: fact,
          );
}
