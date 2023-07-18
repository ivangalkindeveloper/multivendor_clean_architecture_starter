import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'dart:async';

class GetRandomFactUseCase implements IUseCase<Fact> {
  const GetRandomFactUseCase({
    required this.factRepository,
  });

  final IFactRepository factRepository;

  @override
  Future<Fact> execute() => this.factRepository.getOneRandomFact();
}
