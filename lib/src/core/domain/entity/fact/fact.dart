import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../generated/src/core/domain/entity/fact/fact.freezed.dart';

//TODO Starter: Entity
@freezed
class Fact with _$Fact {
  const factory Fact({
    required String id,
    required String description,
  }) = _Fact;
}
