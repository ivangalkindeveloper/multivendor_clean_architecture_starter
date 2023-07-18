import 'package:multi_vendor_starter/src/core/data/repository/fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'dart:async';

abstract class IUpdateFactUseCase {
  Future<void> execute({
    required Fact fact,
  });
}

class UpdateFactUseCase implements IUpdateFactUseCase {
  const UpdateFactUseCase({
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<void> execute({
    required Fact fact,
  }) =>
      this.factRepository.updateLastFact(
            fact: fact,
          );
}
