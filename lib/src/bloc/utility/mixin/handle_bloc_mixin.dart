import 'package:bloc/bloc.dart';

mixin HandleBlocMixin<Event, State> on Bloc<Event, State> {
  State? get defaultErrorState => null;

  Future<void> handle(
    Emitter<State> emit,
    Future<void> Function() execute, {
    void Function(
      Object? error,
      StackTrace stackTrace,
    )? onError,
    State Function(
      Object? error,
      StackTrace stackTrace,
    )? onErrorState,
  }) async {
    try {
      await execute();
    } catch (error, stackTrace) {
      onError?.call(
        error,
        stackTrace,
      );
      final State? errorState = onErrorState?.call(
            error,
            stackTrace,
          ) ??
          defaultErrorState;
      if (errorState == null) {
        return;
      }

      emit(
        errorState,
      );

      rethrow;
    }
  }

  Future<void> fallbackHandle(
    Emitter<State> emit,
    Future<void> Function() execute, {
    void Function(
      Object? error,
      StackTrace stackTrace,
    )? onError,
    State Function(
      Object? error,
      StackTrace stackTrace,
    )? onErrorState,
    State Function(
      Object? error,
      StackTrace stackTrace,
    )? onFallbackState,
  }) async {
    final State currentState = this.state;

    try {
      await execute();
    } catch (error, stackTrace) {
      onError?.call(
        error,
        stackTrace,
      );
      final State? errorState = onErrorState?.call(
            error,
            stackTrace,
          ) ??
          defaultErrorState;
      if (errorState != null) {
        emit(
          errorState,
        );
      }

      final State fallbackState = onErrorState?.call(
            error,
            stackTrace,
          ) ??
          currentState;
      emit(
        fallbackState,
      );

      rethrow;
    }
  }
}
