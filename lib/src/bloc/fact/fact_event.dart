// ignore_for_file:library_private_types_in_public_api
part of 'fact_bloc.dart';

sealed class FactEvent {
  const FactEvent();

  const factory FactEvent.getFact() = _GetFactEvent;

  T map<T>({
    required T Function(_GetFactEvent value) getFact,
  }) =>
      switch (this) {
        _GetFactEvent() => getFact(this as _GetFactEvent),
      };
}

class _GetFactEvent extends FactEvent {
  const _GetFactEvent();
}
