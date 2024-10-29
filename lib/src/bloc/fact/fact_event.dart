// ignore_for_file:library_private_types_in_public_api
part of 'fact_bloc.dart';

sealed class FactEvent extends Equatable {
  const FactEvent();

  factory FactEvent.getFacts() => const _GetFacts();

  @override
  List<Object> get props => [];
}

final class _GetFacts extends FactEvent {
  const _GetFacts();
}

final class _UpdateFacts extends FactEvent {
  const _UpdateFacts({
    required this.state,
  });

  final FactSuccessState state;

  @override
  List<Object> get props => [
        state,
      ];
}
