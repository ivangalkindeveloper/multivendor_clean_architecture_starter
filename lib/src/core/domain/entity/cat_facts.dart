import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/core/domain/entity/cat_facts.freezed.dart';
part '../../../../generated/src/core/domain/entity/cat_facts.g.dart';

@freezed
class CatFacts with _$CatFacts {
  const factory CatFacts({
    required List<CatFact> facts,
  }) = _CatFacts;

  factory CatFacts.fromJson(Map<String, Object?> json) =>
      _$CatFactsFromJson(json);
}
