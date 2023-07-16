import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'dart:async';

abstract class ISaveCatFactUseCase {
  Future<void> execute({
    required CatFact catFact,
  });
}

class SaveCatFactUseCase implements ISaveCatFactUseCase {
  const SaveCatFactUseCase({
    required this.catFactRepository,
  });

  final ICatFactRepository catFactRepository;

  @override
  Future<void> execute({
    required CatFact catFact,
  }) =>
      this.catFactRepository.setCatFact(
            catFact: catFact,
          );
}
