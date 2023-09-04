import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/fact/get_random_fact_use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/fact/get_last_fact_use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/fact/save_fact_use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part '../../../generated/src/bloc/fact/fact_bloc.freezed.dart';
part 'fact_event.dart';
part 'fact_state.dart';

//TODO Starter: Bloc
class FactBloc extends Bloc<FactEvent, IFactState> {
  FactBloc({
    required IFactRepository factRepository,
  })  : this._getLastFactUseCase = GetLastFactUseCase(
          factRepository: factRepository,
        ),
        this._getRandomFactUseCase = GetRandomFactUseCase(
          factRepository: factRepository,
        ),
        this._saveFactUseCase = SaveFactUseCase(
          factRepository: factRepository,
        ),
        super(const FactState(
          lastFactStatus: FactStatus.initial,
          newFactStatus: FactStatus.initial,
        )) {
    on<FactEvent>(
      ((FactEvent event, Emitter<IFactState> emit) => event.map(
            getFacts: (_GetFactsEvent event) => this._getFacts(event, emit),
          )),
      transformer: bloc_concurrency.sequential(),
    );
  }

  final GetLastFactUseCase _getLastFactUseCase;
  final GetRandomFactUseCase _getRandomFactUseCase;
  final SaveFactUseCase _saveFactUseCase;

  void _getFacts(
    _GetFactsEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(
      lastFactStatus: FactStatus.loading,
      newFactStatus: FactStatus.loading,
    ));

    await this._getLastFact(
      emit: emit,
    );
    await this._getAndSaveNewFact(
      emit: emit,
    );
  }

  Future<void> _getLastFact({
    required Emitter emit,
  }) async {
    try {
      final Fact? lastFact = await this._getLastFactUseCase.execute();
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
          lastFactStatus: FactStatus.error,
        ),
      );
      rethrow;
    }
  }

  Future<void> _getAndSaveNewFact({
    required Emitter emit,
  }) async {
    try {
      final Fact randomFact = await this._getRandomFactUseCase.execute();

      await this._saveFactUseCase.execute(
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
          newFactStatus: FactStatus.error,
        ),
      );
      rethrow;
    }
  }
}
