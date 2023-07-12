import 'package:multi_vendor_starter/src/presentation/component/global/mvs_picker.dart';
import 'package:flutter/widgets.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
  });

  static show({
    required BuildContext context,
  }) =>
      showMVSDatePicker(
        context: context,
        cupertinoModalBuilder: (BuildContext context) => const DatePicker(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
