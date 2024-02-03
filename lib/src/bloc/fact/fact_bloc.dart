import 'package:multivendor_clean_architecture_starter/src/core/domain/interactor/fact_interactor.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fact_event.dart';
part 'fact_state.dart';

//TODO Starter: Bloc
class FactBloc extends Bloc<FactEvent, IFactState> {
  FactBloc({
    required IFactRepository factRepository,
  })  : this._factInteractor = FactInteractor(
          factRepository: factRepository,
        ),
        super(
          const FactState(),
        ) {
    on<FactEvent>(
      (
        FactEvent event,
        Emitter<IFactState> emit,
      ) =>
          event.map(
        getFact: (
          _GetFactEvent event,
        ) =>
            this._getFacts(
          event,
          emit,
        ),
      ),
      transformer: sequential(),
    );
  }

  final FactInteractor _factInteractor;

  Future<void> _getFacts(
    _GetFactEvent event,
    Emitter emit,
  ) async {
    emit(
      state.copyWith(
        lastFactStatus: FactStatus.loading,
        newFactStatus: FactStatus.loading,
      ),
    );
    await this._getLastFact(
      emit,
    );
    await this._getAndSaveNewFact(
      emit,
    );
  }

  Future<void> _getLastFact(
    Emitter emit,
  ) async {
    try {
      final Fact? lastFact = await this._factInteractor.getLast();
      emit(
        state.copyWith(
          lastFact: lastFact,
          lastFactStatus: FactStatus.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          lastFactError: error.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _getAndSaveNewFact(
    Emitter emit,
  ) async {
    try {
      final Fact randomFact = await this._factInteractor.getRandom();
      await this._factInteractor.save(
            fact: randomFact,
          );
      emit(
        state.copyWith(
          newFact: randomFact,
          newFactStatus: FactStatus.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          newFactError: error.toString(),
        ),
      );
      rethrow;
    }
  }
}
