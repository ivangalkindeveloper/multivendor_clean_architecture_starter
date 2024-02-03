import 'package:json_annotation/json_annotation.dart';

part '../../../generated/src/dto/fact/fact_dto.g.dart';

//TODO Starter: DTO
@JsonSerializable()
class FactDto {
  const FactDto({
    required this.id,
    required this.description,
  });

  factory FactDto.fromJson(Map<String, Object?> json) =>
      _$FactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FactDtoToJson(this);

  @JsonKey(
    name: "_id",
  )
  final String id;
  @JsonKey(
    name: "text",
  )
  final String description;
}
