import 'package:multivendor_clean_architecture_starter/src/core/domain/interactor/fact_interactor.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact_bo.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fact_event.dart';
part 'fact_state.dart';

//TODO Starter: Bloc
class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc({
    required IFactRepository factRepository,
  })  : this._factInteractor = FactInteractor(
          factRepository: factRepository,
        ),
        super(
          const FactInitialState(),
        ) {
    on<FactEvent>(
      (
        FactEvent event,
        Emitter<FactState> emit,
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
      FactLoadingState(
        data: state.data,
      ),
    );
    await Future.delayed(
      const Duration(seconds: 1),
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
      final FactBO? lastFact = await this._factInteractor.getLast();
      emit(
        FactSuccessState(
          data: state.data.copyWith(
            lastFact: lastFact,
          ),
        ),
      );
    } catch (error) {
      emit(
        FactSuccessState(
          data: state.data.copyWith(
            lastFactError: error.toString(),
          ),
        ),
      );
      rethrow;
    }
  }

  Future<void> _getAndSaveNewFact(
    Emitter emit,
  ) async {
    try {
      final FactBO randomFact = await this._factInteractor.getRandom();
      await this._factInteractor.save(
            fact: randomFact,
          );
      emit(
        FactSuccessState(
          data: state.data.copyWith(
            newFact: randomFact,
          ),
        ),
      );
    } catch (error) {
      emit(
        FactSuccessState(
          data: state.data.copyWith(
            newFactError: error.toString(),
          ),
        ),
      );
      rethrow;
    }
  }
}
