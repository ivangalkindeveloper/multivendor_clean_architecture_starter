import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_picker.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: TimeOfDayPicker
class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
  });

  static show(BuildContext context) => showMVSTimePicker(
        context: context,
        cupertinoModalBuilder: (BuildContext context) => const TimePicker(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
