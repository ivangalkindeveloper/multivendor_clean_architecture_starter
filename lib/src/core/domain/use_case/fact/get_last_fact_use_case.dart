import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact.dart';
import 'dart:async';

//TODO Starter: UseCase
class GetLastFactUseCase implements IUseCase<Fact?> {
  const GetLastFactUseCase({
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<Fact?> execute() => this.factRepository.getLastFact();
}
