part of 'fact_bloc.dart';

class FactStateData {
  const FactStateData({
    this.lastFact,
    this.lastFactError,
    this.newFact,
    this.newFactError,
  });

  final FactBO? lastFact;
  final String? lastFactError;
  final FactBO? newFact;
  final String? newFactError;

  FactStateData copyWith({
    FactBO? lastFact,
    String? lastFactError,
    FactBO? newFact,
    String? newFactError,
  }) =>
      FactStateData(
        lastFact: lastFact ?? this.lastFact,
        lastFactError: lastFactError ?? this.lastFactError,
        newFact: newFact ?? this.newFact,
        newFactError: newFactError ?? this.newFactError,
      );
}

sealed class FactState extends Equatable {
  const FactState({
    this.data = const FactStateData(),
  });

  final FactStateData data;

  @override
  List<Object?> get props => [
        this.data,
      ];
}

class FactInitialState extends FactState {
  const FactInitialState({
    super.data,
  });
}

class FactLoadingState extends FactState {
  const FactLoadingState({
    super.data,
  });
}

class FactSuccessState extends FactState {
  const FactSuccessState({
    super.data,
  });
}

class FactErrorState extends FactState {
  const FactErrorState({
    super.data,
  });
}
