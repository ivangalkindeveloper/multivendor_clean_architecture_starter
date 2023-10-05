import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_snackbar.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: DangerSnackBar
class DangerSnackBar extends StatelessWidget {
  const DangerSnackBar({super.key});

  static show(BuildContext context) => showMVSSnackbar(
        context: context,
        child: const DangerSnackBar(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
