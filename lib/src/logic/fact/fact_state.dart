part of 'fact_bloc.dart';

enum FactStatus {
  initial,
  loading,
  success,
  error,
}

class FactState extends Equatable {
  const FactState({
    this.lastFact,
    this.lastFactStatus = FactStatus.initial,
    this.lastFactError,
    //
    this.newFact,
    this.newFactStatus = FactStatus.initial,
    this.newFactError,
  });

  final Fact? lastFact;
  final FactStatus lastFactStatus;
  final String? lastFactError;
  //
  final Fact? newFact;
  final FactStatus newFactStatus;
  final String? newFactError;

  @override
  List get props => [
        this.lastFact,
        this.lastFactStatus,
        this.lastFactError,
        //
        this.newFact,
        this.newFactStatus,
        this.newFactError,
      ];

  FactState copyWith({
    Fact? lastFact,
    FactStatus? lastFactStatus,
    String? lastFactError,
    //
    Fact? newFact,
    FactStatus? newFactStatus,
    String? newFactError,
  }) =>
      FactState(
        lastFact: lastFact ?? this.lastFact,
        lastFactStatus: lastFactStatus ?? this.lastFactStatus,
        lastFactError: lastFactError,
        //
        newFact: newFact ?? this.newFact,
        newFactStatus: newFactStatus ?? this.newFactStatus,
        newFactError: newFactError,
      );
}
