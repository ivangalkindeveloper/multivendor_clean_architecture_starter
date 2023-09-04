part of 'fact_bloc.dart';

abstract class IFactState {
  const IFactState();

  abstract final Fact? lastFact;
  abstract final FactStatus lastFactStatus;
  abstract final String? lastFactError;
  //
  abstract final Fact? newFact;
  abstract final FactStatus newFactStatus;
  abstract final String? newFactError;

  IFactState copyWith({
    Fact? lastFact,
    FactStatus? lastFactStatus,
    String? lastFactError,
    //
    Fact? newFact,
    FactStatus? newFactStatus,
    String? newFactError,
  });
}

enum FactStatus {
  initial,
  loading,
  success,
  error,
}

class FactState extends Equatable implements IFactState {
  const FactState({
    this.lastFact,
    this.lastFactStatus = FactStatus.initial,
    this.lastFactError,
    //
    this.newFact,
    this.newFactStatus = FactStatus.initial,
    this.newFactError,
  });

  @override
  final Fact? lastFact;
  @override
  final FactStatus lastFactStatus;
  @override
  final String? lastFactError;
  //
  @override
  final Fact? newFact;
  @override
  final FactStatus newFactStatus;
  @override
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

  @override
  IFactState copyWith({
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
