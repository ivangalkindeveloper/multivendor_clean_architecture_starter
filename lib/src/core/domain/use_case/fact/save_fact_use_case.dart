import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'dart:async';

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
      this.factRepository.insertNewFact(
            fact: fact,
          );
}
