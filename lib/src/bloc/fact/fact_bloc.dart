import 'package:multivendor_clean_architecture_starter/src/bloc/utility/mixin/handle_bloc_mixin.dart';
import 'package:multivendor_clean_architecture_starter/src/bloc/utility/mixin/last_success_state_bloc_mixin.dart';
import 'package:multivendor_clean_architecture_starter/src/domain/interactor/fact_interactor.dart';
import 'package:multivendor_clean_architecture_starter/src/domain/entity/fact.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fact_event.dart';
part 'fact_state.dart';

//TODO Starter: Bloc
final class FactBloc extends Bloc<FactEvent, FactState>
    with
        HandleBlocMixin<FactEvent, FactState>,
        LastSucessStateMixin<FactEvent, FactState, FactSuccessState> {
  FactBloc({
    required FactInteractor factInteractor,
  })  : this._factInteractor = factInteractor,
        super(
          const FactLoadingState(),
        ) {
    on<FactEvent>(
      (
        FactEvent event,
        Emitter<FactState> emit,
      ) =>
          switch (event) {
        _GetFacts() => this._getFacts(
            event,
            emit,
          ),
        _UpdateFacts() => this._updateFacts(
            event,
            emit,
          ),
      },
      transformer: sequential(),
    );
  }

  final FactInteractor _factInteractor;

  @override
  final FactErrorState defaultErrorState = const FactErrorState();

  Future<void> _getFacts(
    _GetFacts event,
    Emitter<FactState> emit,
  ) async {
    clearSuccessState();
    emit(
      const FactLoadingState(),
    );

    await Future.delayed(
      const Duration(seconds: 1),
    );

    this._getLastFact(
      emit,
    );
    this._getRandomFast(
      emit,
    );
  }

  void _getLastFact(
    Emitter<FactState> emit,
  ) =>
      handle(
        emit,
        () async {
          final Fact? lastFact = await this._factInteractor.getLast();

          final FactSuccessState? lastSuccessState = this.lastSuccessState;
          if (lastSuccessState == null) {
            return add(
              _UpdateFacts(
                state: FactSuccessState(
                  lastFact: lastFact,
                  isNewFactLoading: true,
                ),
              ),
            );
          }
          return add(
            _UpdateFacts(
              state: lastSuccessState.copyWith(
                isLastFactLoading: false,
                lastFact: lastFact,
              ),
            ),
          );
        },
      );

  void _getRandomFast(
    Emitter<FactState> emit,
  ) =>
      handle(
        emit,
        () async {
          final Fact randomFact = await this._factInteractor.getRandom();
          await this._factInteractor.save(
                fact: randomFact,
              );

          final FactSuccessState? lastSuccessState = this.lastSuccessState;
          if (lastSuccessState == null) {
            return add(
              _UpdateFacts(
                state: FactSuccessState(
                  isLastFactLoading: true,
                  newFact: randomFact,
                ),
              ),
            );
          }
          return add(
            _UpdateFacts(
              state: lastSuccessState.copyWith(
                isNewFactLoading: false,
                newFact: randomFact,
              ),
            ),
          );
        },
      );

  void _updateFacts(
    _UpdateFacts event,
    Emitter<FactState> emit,
  ) =>
      emitSuccessState(
        emit,
        event.state,
      );
}
