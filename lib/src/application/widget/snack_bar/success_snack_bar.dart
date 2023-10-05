import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_snackbar.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: SuccessSnackBar
class SuccessSnackBar extends StatelessWidget {
  const SuccessSnackBar({super.key});

  static show(BuildContext context) => showMVSSnackbar(
        context: context,
        child: const SuccessSnackBar(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
