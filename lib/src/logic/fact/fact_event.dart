part of 'fact_bloc.dart';

@freezed
class FactEvent with _$FactEvent {
  const factory FactEvent.getFacts() = _GetFactsEvent;
}
