import 'package:multivendor_clean_architecture_starter/src/core/data/data/initialization/initialization_progress.dart';
import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:mvs_utility/mvs_utility.dart';

typedef InitializationStep
    = MVSInitializationStep<IConfig, InitializationProgress>;
