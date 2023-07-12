import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_event.dart';
part 'initial_state.dart';
part '../../../../../../generated/src/presentation/feature/page/initial/bloc/initial_bloc.freezed.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(const _Initial()) {
    on<InitialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
