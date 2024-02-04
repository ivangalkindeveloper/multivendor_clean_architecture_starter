import 'package:mvs_utility/mvs_utility.dart';

abstract class IMVSInitializationCallback<Step extends MVSInitializationStep,
    Result> {
  const IMVSInitializationCallback();

  void onStart(
    List<Step> steps,
  );

  void onStepStart(
    List<Step> steps,
    Step step,
    Duration duration,
  );

  void onStepSuccess(
    List<Step> steps,
    Step step,
    Duration duration,
  );

  void onSuccess(
    Result result,
    Duration duration,
  );

  void onError(
    List<Step> steps,
    Step step,
    dynamic error,
    StackTrace stackTrace,
  );
}
