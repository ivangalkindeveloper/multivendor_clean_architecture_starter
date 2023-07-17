import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/core/domain/entity/cat_fact.freezed.dart';
part '../../../../generated/src/core/domain/entity/cat_fact.g.dart';

@freezed
class CatFact with _$CatFact {
  const factory CatFact({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "text") required String description,
  }) = _CatFact;

  factory CatFact.fromJson(Map<String, Object?> json) =>
      _$CatFactFromJson(json);
}
