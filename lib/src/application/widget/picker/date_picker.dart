import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_picker.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: DatePicker
class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
  });

  static show(BuildContext context) => showMVSDatePicker(
        context: context,
        cupertinoModalBuilder: (BuildContext context) => const DatePicker(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
