part of 'application_bloc.dart';

sealed class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => const [];
}

final class ApplicationState$Success extends ApplicationState {
  const ApplicationState$Success({
    this.themeType,
    this.localeTag,
  });

  final String? themeType;
  final String? localeTag;

  ApplicationState$Success copyWith({
    String? themeType,
    String? localeTag,
  }) =>
      ApplicationState$Success(
        themeType: themeType ?? this.themeType,
        localeTag: localeTag ?? this.localeTag,
      );
}
