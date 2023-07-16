import 'package:multi_vendor_starter/src/core/domain/use_case/get_random_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/get_last_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/domain/use_case/save_cat_fact_use_case.dart';
import 'package:multi_vendor_starter/src/core/data/repository/cat_fact_repository.dart';
import 'package:multi_vendor_starter/src/core/domain/entity/cat_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

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
    on<_InitialEvent>(this._onInitial);
    on<_ReloadEvent>(this._onReload);
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

  void _onInitial(event, emit) async {
    emit(state.copyWith(
      lastCatFactStatus: CatFactStatus.loading,
      newCatFactStatus: CatFactStatus.loading,
    ));

    try {
      final CatFact? lastCatFact = await this.getLastCatFactUseCase.execute();
      emit(
        state.copyWith(
          lastCatFact: lastCatFact,
          lastCatFactStatus: CatFactStatus.success,
        ),
      );

      final CatFact randomCatFact =
          await this.getRandomCatFactUseCase.execute();
      await this.saveCatFactUseCase.execute(catFact: randomCatFact);
      emit(
        state.copyWith(
          newCatFact: randomCatFact,
          newCatFactStatus: CatFactStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
    }
  }

  void _onReload(event, emit) {}
}
