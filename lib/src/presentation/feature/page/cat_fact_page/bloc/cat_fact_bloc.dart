import 'package:multi_vendor_starter/src/core/domain/use_case/cat_fact/get_random_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/cat_fact/get_last_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/cat_fact/update_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/cat_fact/save_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cat_fact_event.dart';
part 'cat_fact_state.dart';
part '../../../../../../generated/src/presentation/feature/page/cat_fact_page/bloc/cat_fact_bloc.freezed.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  CatFactBloc({
    required this.catFactRepository,
  }) : super(const CatFactState(
          lastCatFactStatus: CatFactStatus.initial,
          newCatFactStatus: CatFactStatus.initial,
        )) {
    on<_GetCatFactsEvent>(this._getCatFacts);
  }

  final ICatFactRepository catFactRepository;

  late final GetLastCatFactUseCase getLastCatFactUseCase =
      GetLastCatFactUseCase(
    catFactRepository: this.catFactRepository,
  );
  late final GetRandomCatFactUseCase getRandomCatFactUseCase =
      GetRandomCatFactUseCase(
    catFactRepository: this.catFactRepository,
  );
  late final SaveCatFactUseCase saveCatFactUseCase = SaveCatFactUseCase(
    catFactRepository: this.catFactRepository,
  );
  late final UpdateCatFactUseCase updateCatFactUseCase = UpdateCatFactUseCase(
    catFactRepository: this.catFactRepository,
  );

  void _getCatFacts(
    _GetCatFactsEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(
      lastCatFactStatus: CatFactStatus.loading,
      newCatFactStatus: CatFactStatus.loading,
    ));

    await this._getLastFact(
      emit: emit,
    );
    await this._getAndSaveNewCatFact(
      emit: emit,
    );
  }

  Future<void> _getLastFact({
    required Emitter emit,
  }) async {
    try {
      final CatFact? lastCatFact = await this.getLastCatFactUseCase.execute();
      emit(
        state.copyWith(
          lastCatFact: lastCatFact,
          lastCatFactStatus: CatFactStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(
        state.copyWith(
          lastCatFactError: error.toString(),
          lastCatFactStatus: CatFactStatus.error,
        ),
      );
    }
  }

  Future<void> _getAndSaveNewCatFact({
    required Emitter emit,
  }) async {
    try {
      final CatFact randomCatFact =
          await this.getRandomCatFactUseCase.execute();

      if (state.lastCatFact == null) {
        await this.saveCatFactUseCase.execute(
              catFact: randomCatFact,
            );
      } else {
        await this.updateCatFactUseCase.execute(
              catFact: randomCatFact,
            );
      }

      emit(
        state.copyWith(
          newCatFact: randomCatFact,
          newCatFactStatus: CatFactStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(
        state.copyWith(
          newCatFactError: error.toString(),
          newCatFactStatus: CatFactStatus.error,
        ),
      );
    }
  }
}
