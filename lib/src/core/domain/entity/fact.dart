import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/core/domain/entity/fact.freezed.dart';
part '../../../../generated/src/core/domain/entity/fact.g.dart';

@freezed
class Fact with _$Fact {
  const factory Fact({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "text") required String description,
  }) = _Fact;

  factory Fact.fromJson(Map<String, Object?> json) => _$FactFromJson(json);
}
