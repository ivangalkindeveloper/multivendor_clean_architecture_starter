import 'package:json_annotation/json_annotation.dart';

part '../../../generated/src/dto/fact/mvs_fact_dto.g.dart';

//TODO Starter: DTO
@JsonSerializable()
class MVSFactDto {
  const MVSFactDto({
    required this.id,
    required this.description,
  });

  factory MVSFactDto.fromJson(Map<String, Object?> json) =>
      _$MVSFactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MVSFactDtoToJson(this);

  @JsonKey(
    name: "_id",
  )
  final String id;
  @JsonKey(
    name: "text",
  )
  final String description;
}
