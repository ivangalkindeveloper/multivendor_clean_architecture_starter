import 'package:multi_vendor_starter/src/core/utility/extension/string_extension.dart';
import 'package:multi_vendor_starter/src/core/utility/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBlocObserver extends BlocObserver {
  const ApplicationBlocObserver();

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Bloc: ${bloc.runtimeType} | ${transition.event.runtimeType}')
      ..writeln(
          'Transition: ${transition.currentState.runtimeType} -> ${transition.nextState.runtimeType}')
      ..writeln('New State: ${transition.nextState.toString().limit(100)}');
    Logger.i(stringBuffer.toString());

    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(
    Bloc<Object?, Object?> bloc,
    Object? event,
  ) {
    final StringBuffer stringBuffer = StringBuffer()
      ..writeln('\n')
      ..writeln('Bloc: ${bloc.runtimeType} | ${event.runtimeType}')
      ..writeln('Event: ${event.toString().limit(100)}');
    Logger.i(stringBuffer.toString());

    super.onEvent(bloc, event);
  }

  @override
  void onError(
    BlocBase<Object?> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    Logger.e('Bloc: ${bloc.runtimeType} | $error', stackTrace);

    super.onError(bloc, error, stackTrace);
  }
}
