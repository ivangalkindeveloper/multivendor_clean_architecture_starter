import 'package:multivendor_clean_architecture_starter/src/application/router/application_router.dart';
import 'package:multivendor_clean_architecture_starter/src/core/environment.dart';
import 'package:multivendor_clean_architecture_starter/src/domain/interactor/fact_interactor.dart';
import 'package:multivendor_clean_architecture_starter/src/repository/shared_repository.dart';
import 'package:mvs_widget/mvs_widget.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: Dependency
class Dependency {
  const Dependency({
    required this.environment,
    required this.sharedRepository,
    required this.factInteractor,
    required this.theme,
    required this.locale,
    required this.router,
  });

  final Environment environment;
  final SharedRepository sharedRepository;
  final FactInteractor factInteractor;
  final MVSTheme theme;
  final Locale locale;
  final ApplicationRouter router;
}
