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
    required this.lastCatFactStatus,
    this.newCatFact,
    required this.newCatFactStatus,
  });

  final CatFact? lastCatFact;
  final CatFactStatus lastCatFactStatus;
  final CatFact? newCatFact;
  final CatFactStatus newCatFactStatus;

  @override
  List get props => [
        this.lastCatFact,
        this.lastCatFactStatus,
        this.newCatFact,
        this.newCatFactStatus,
      ];

  CatFactState copyWith({
    CatFact? lastCatFact,
    CatFactStatus? lastCatFactStatus,
    CatFact? newCatFact,
    CatFactStatus? newCatFactStatus,
  }) =>
      CatFactState(
        lastCatFact: lastCatFact,
        lastCatFactStatus: lastCatFactStatus ?? this.lastCatFactStatus,
        newCatFact: newCatFact,
        newCatFactStatus: newCatFactStatus ?? this.newCatFactStatus,
      );
}
