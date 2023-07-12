import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/core/domain/entity/domain_entity.freezed.dart';
part '../../../../generated/src/core/domain/entity/domain_entity.g.dart';

@freezed
class DomainEntity with _$DomainEntity {
  const factory DomainEntity({
    required String name,
  }) = _DomainEntity;

  factory DomainEntity.fromJson(Map<String, Object?> json) =>
      _$DomainEntityFromJson(json);
}
