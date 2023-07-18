import 'package:multi_vendor_starter/src/core/domain/use_case/fact/get_random_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/fact/get_last_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/fact/update_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/fact/save_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/data/repository/fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fact_event.dart';
part 'fact_state.dart';
part '../../../../../../generated/src/presentation/feature/page/fact_page/bloc/fact_bloc.freezed.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc({
    required this.factRepository,
  }) : super(const FactState(
          lastFactStatus: FactStatus.initial,
          newFactStatus: FactStatus.initial,
        )) {
    on<_GetFactsEvent>(this._getFacts);
  }

  final IFactRepository factRepository;

  late final GetLastFactUseCase getLastFactUseCase = GetLastFactUseCase(
    factRepository: this.factRepository,
  );
  late final GetRandomFactUseCase getRandomFactUseCase = GetRandomFactUseCase(
    factRepository: this.factRepository,
  );
  late final SaveFactUseCase saveFactUseCase = SaveFactUseCase(
    factRepository: this.factRepository,
  );
  late final UpdateFactUseCase updateFactUseCase = UpdateFactUseCase(
    factRepository: this.factRepository,
  );

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
      final Fact? lastFact = await this.getLastFactUseCase.execute();
      emit(
        state.copyWith(
          lastFact: lastFact,
          lastFactStatus: FactStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(
        state.copyWith(
          lastFactError: error.toString(),
          lastFactStatus: FactStatus.error,
        ),
      );
    }
  }

  Future<void> _getAndSaveNewFact({
    required Emitter emit,
  }) async {
    try {
      final Fact randomFact = await this.getRandomFactUseCase.execute();

      if (state.lastFact == null) {
        await this.saveFactUseCase.execute(
              fact: randomFact,
            );
      } else {
        await this.updateFactUseCase.execute(
              fact: randomFact,
            );
      }

      emit(
        state.copyWith(
          newFact: randomFact,
          newFactStatus: FactStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(
        state.copyWith(
          newFactError: error.toString(),
          newFactStatus: FactStatus.error,
        ),
      );
    }
  }
}
