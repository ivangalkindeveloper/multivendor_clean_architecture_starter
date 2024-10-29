// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fact_bloc.dart';

sealed class FactState extends Equatable {
  const FactState();

  @override
  List<Object?> get props => const [];
}

final class FactLoadingState extends FactState {
  const FactLoadingState();
}

final class FactSuccessState extends FactState {
  const FactSuccessState({
    this.isLastFactLoading = false,
    this.lastFact,
    this.isNewFactLoading = false,
    this.newFact,
  });

  final bool isLastFactLoading;
  final Fact? lastFact;
  final bool isNewFactLoading;
  final Fact? newFact;

  FactSuccessState copyWith({
    bool? isLastFactLoading,
    Fact? lastFact,
    bool? isNewFactLoading,
    Fact? newFact,
  }) =>
      FactSuccessState(
        isLastFactLoading: isLastFactLoading ?? this.isLastFactLoading,
        lastFact: lastFact ?? this.lastFact,
        isNewFactLoading: isNewFactLoading ?? this.isNewFactLoading,
        newFact: newFact ?? this.newFact,
      );

  @override
  List<Object?> get props => [
        this.isLastFactLoading,
        this.lastFact,
        this.isNewFactLoading,
        this.newFact,
      ];
}

final class FactErrorState extends FactState {
  const FactErrorState();
}
