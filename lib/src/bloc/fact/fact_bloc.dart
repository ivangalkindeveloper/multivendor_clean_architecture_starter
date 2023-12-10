import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/fact/get_random_fact_use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/fact/get_last_fact_use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/use_case/fact/save_fact_use_case.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/repository/fact_repository.dart';
import 'package:multivendor_clean_architecture_starter/src/core/domain/entity/fact/fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part '../../../generated/src/bloc/fact/fact_bloc.freezed.dart';
part 'fact_event.dart';
part 'fact_state.dart';

//TODO Starter: Bloc
class FactBloc extends Bloc<FactEvent, IFactState> {
  FactBloc({
    required IFactRepository factRepository,
  })  : this._getRandomFactUseCase = GetRandomFactUseCase(
          factRepository: factRepository,
        ),
        this._getLastFactUseCase = GetLastFactUseCase(
          factRepository: factRepository,
        ),
        this._saveFactUseCase = SaveFactUseCase(
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
        getFacts: (
          _GetFactsEvent event,
        ) =>
            this._getFacts(
          event,
          emit,
        ),
      ),
      transformer: sequential(),
    );
  }

  final GetRandomFactUseCase _getRandomFactUseCase;
  final GetLastFactUseCase _getLastFactUseCase;
  final SaveFactUseCase _saveFactUseCase;

  Future<void> _getFacts(
    _GetFactsEvent event,
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
        ),
      );
      rethrow;
    }
  }

  Future<void> _getAndSaveNewFact(
    Emitter emit,
  ) async {
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
        ),
      );
      rethrow;
    }
  }
}
