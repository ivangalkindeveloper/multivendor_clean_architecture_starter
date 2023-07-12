import 'package:multi_vendor_starter/src/presentation/component/global/mvs_picker.dart';
import 'package:flutter/widgets.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
  });

  static show({
    required BuildContext context,
  }) =>
      showMVSTimePicker(
        context: context,
        cupertinoModalBuilder: (BuildContext context) => const TimePicker(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
