import 'package:multivendor_clean_architecture_starter/src/repository/shared_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'application_event.dart';
part 'application_state.dart';

final class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    required String initialThemeType,
    required String initialLocaleTag,
    required SharedRepository sharedRepository,
  })  : this._sharedRepository = sharedRepository,
        super(
          ApplicationState$Success(
            themeType: initialThemeType,
            localeTag: initialLocaleTag,
          ),
        ) {
    on<ApplicationEvent>(
      (
        ApplicationEvent event,
        Emitter<ApplicationState> emit,
      ) =>
          switch (event) {
        _ChangeTheme() => this._changeTheme(
            event,
            emit,
          ),
        _ChangeLocale() => this._changeLocale(
            event,
            emit,
          ),
      },
      transformer: sequential(),
    );
  }

  final SharedRepository _sharedRepository;

  Future<void> _changeTheme(
    _ChangeTheme event,
    Emitter emit,
  ) async {
    final ApplicationState currentState = this.state;
    if (state is! ApplicationState$Success) {
      return;
    }
    currentState as ApplicationState$Success;

    await this._sharedRepository.setThemeType(
          themeType: event.themeType,
        );
    emit(
      currentState.copyWith(
        themeType: event.themeType,
      ),
    );
  }

  Future<void> _changeLocale(
    _ChangeLocale event,
    Emitter emit,
  ) async {
    final ApplicationState currentState = this.state;
    if (state is! ApplicationState$Success) {
      return;
    }
    currentState as ApplicationState$Success;

    await this._sharedRepository.setThemeType(
          themeType: event.localeTag,
        );
    emit(
      currentState.copyWith(
        themeType: event.localeTag,
      ),
    );
  }
}
