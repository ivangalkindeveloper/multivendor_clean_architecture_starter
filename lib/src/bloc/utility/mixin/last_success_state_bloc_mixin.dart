import 'package:bloc/bloc.dart';

mixin LastSucessStateMixin<Event, State, SuccessState extends State>
    on Bloc<Event, State> {
  SuccessState? lastSuccessState;

  void emitSuccessState(
    Emitter<State> emit,
    SuccessState state,
  ) {
    emit(
      state,
    );
    lastSuccessState = state;
  }

  void clearSuccessState() => lastSuccessState = null;
}
