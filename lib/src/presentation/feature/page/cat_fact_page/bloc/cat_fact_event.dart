part of 'cat_fact_bloc.dart';

@freezed
class CatFactEvent with _$CatFactEvent {
  const factory CatFactEvent.getCatFacts() = _GetCatFactsEvent;
}
