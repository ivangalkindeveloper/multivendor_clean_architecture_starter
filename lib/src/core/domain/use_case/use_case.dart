import 'dart:async';

abstract class IUseCase<T> {
  const IUseCase();

  FutureOr<T> execute();
}
