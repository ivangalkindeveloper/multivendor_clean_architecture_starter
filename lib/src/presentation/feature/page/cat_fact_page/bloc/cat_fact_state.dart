part of 'cat_fact_bloc.dart';

enum CatFactStatus {
  initial,
  loading,
  success,
  error,
}

class CatFactState extends Equatable {
  const CatFactState({
    this.lastCatFact,
    this.lastCatFactStatus = CatFactStatus.initial,
    this.lastCatFactError,
    //
    this.newCatFact,
    this.newCatFactStatus = CatFactStatus.initial,
    this.newCatFactError,
  });

  final CatFact? lastCatFact;
  final CatFactStatus lastCatFactStatus;
  final String? lastCatFactError;
  //
  final CatFact? newCatFact;
  final CatFactStatus newCatFactStatus;
  final String? newCatFactError;

  @override
  List get props => [
        this.lastCatFact,
        this.lastCatFactStatus,
        this.lastCatFactError,
        //
        this.newCatFact,
        this.newCatFactStatus,
        this.newCatFactError,
      ];

  CatFactState copyWith({
    CatFact? lastCatFact,
    CatFactStatus? lastCatFactStatus,
    String? lastCatFactError,
    //
    CatFact? newCatFact,
    CatFactStatus? newCatFactStatus,
    String? newCatFactError,
  }) =>
      CatFactState(
        lastCatFact: lastCatFact ?? this.lastCatFact,
        lastCatFactStatus: lastCatFactStatus ?? this.lastCatFactStatus,
        lastCatFactError: lastCatFactError,
        //
        newCatFact: newCatFact ?? this.newCatFact,
        newCatFactStatus: newCatFactStatus ?? this.newCatFactStatus,
        newCatFactError: newCatFactError,
      );
}
