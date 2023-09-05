import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_snackbar.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: DangerSnackbar
class DangerSnackbar extends StatelessWidget {
  const DangerSnackbar({super.key});

  static show(BuildContext context) => showMVSSnackbar(
        context: context,
        child: const DangerSnackbar(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
