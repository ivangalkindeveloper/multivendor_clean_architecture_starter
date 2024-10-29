part of 'application_bloc.dart';

sealed class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  const factory ApplicationEvent.changeTheme({
    required String themeType,
  }) = _ChangeTheme;
  const factory ApplicationEvent.changeLocale({
    required String localeTag,
  }) = _ChangeLocale;

  @override
  List<Object> get props => [];
}

final class _ChangeTheme extends ApplicationEvent {
  const _ChangeTheme({
    required this.themeType,
  });

  final String themeType;

  @override
  List<Object> get props => [
        this.themeType,
      ];
}

final class _ChangeLocale extends ApplicationEvent {
  const _ChangeLocale({
    required this.localeTag,
  });

  final String localeTag;

  @override
  List<Object> get props => [
        this.localeTag,
      ];
}
