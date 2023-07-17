import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'dart:async';

abstract class IUpdateCatFactUseCase {
  Future<void> execute({
    required CatFact catFact,
  });
}

class UpdateCatFactUseCase implements IUpdateCatFactUseCase {
  const UpdateCatFactUseCase({
    required this.catFactRepository,
  });

  final ICatFactRepository catFactRepository;

  @override
  Future<void> execute({
    required CatFact catFact,
  }) =>
      this.catFactRepository.updateCatFact(
            catFact: catFact,
          );
}
