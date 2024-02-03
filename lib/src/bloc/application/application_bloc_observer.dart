import "package:multivendor_clean_architecture_starter/src/utility/extension/string_extension.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mvs_utility/mvs_utility.dart";

//TODO Starter: ApplicationBlocObserver
class ApplicationBlocObserver extends BlocObserver {
  const ApplicationBlocObserver();

  @override
  void onCreate(
    BlocBase<Object?> bloc,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Bloc Create: ${bloc.runtimeType}\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
    super.onCreate(
      bloc,
    );
  }

  @override
  void onEvent(
    Bloc<Object?, Object?> bloc,
    Object? event,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Bloc Event: ${bloc.runtimeType}",
    );
    buffer.writeln(
      "Event: ${event.runtimeType}\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
    super.onEvent(
      bloc,
      event,
    );
  }

  @override
  void onChange(
    BlocBase<Object?> bloc,
    Change<dynamic> change,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Bloc Change: ${bloc.runtimeType}",
    );
    buffer.writeln(
      "Change: ${change.currentState.runtimeType} > ${change.nextState.runtimeType}\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
    super.onChange(
      bloc,
      change,
    );
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Bloc Transition: ${bloc.runtimeType}",
    );
    buffer.writeln(
      "Event: ${transition.event.runtimeType}",
    );
    buffer.writeln(
      "State: ${transition.currentState.runtimeType} > ${transition.nextState.runtimeType}",
    );
    buffer.writeln(
      "New State: ${transition.nextState.toString().limit(100)}",
    );
    MVSLogger.i(
      buffer.toString(),
    );
    super.onTransition(
      bloc,
      transition,
    );
  }

  @override
  void onError(
    BlocBase<Object?> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Bloc Error: ${bloc.runtimeType}",
    );
    buffer.writeln(
      "Error: ${error.runtimeType}",
    );
    buffer.writeln(
      "StackTrace: ${stackTrace.toString()}\n",
    );
    MVSLogger.e(
      buffer.toString(),
    );
    super.onError(
      bloc,
      error,
      stackTrace,
    );
  }

  @override
  void onClose(
    BlocBase<Object?> bloc,
  ) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeln(
      "Bloc Close: ${bloc.runtimeType}\n",
    );
    MVSLogger.i(
      buffer.toString(),
    );
    super.onClose(
      bloc,
    );
  }
}
