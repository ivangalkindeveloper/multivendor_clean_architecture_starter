import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'dart:async';

class GetLastCatFactUseCase implements IUseCase<CatFact?> {
  const GetLastCatFactUseCase({
    required this.catFactRepository,
  });

  final ICatFactRepository catFactRepository;

  @override
  Future<CatFact?> execute() => this.catFactRepository.getCatFact();
}
