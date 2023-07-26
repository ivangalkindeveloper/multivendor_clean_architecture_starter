import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../../generated/src/core/data/data/dto/fact/fact_dto.freezed.dart';
part '../../../../../../generated/src/core/data/data/dto/fact/fact_dto.g.dart';

//TODO Starter: DTO
@freezed
class FactDto with _$FactDto {
  const factory FactDto({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "text") required String description,
  }) = _FactDto;

  factory FactDto.fromJson(Map<String, Object?> json) =>
      _$FactDtoFromJson(json);
}
