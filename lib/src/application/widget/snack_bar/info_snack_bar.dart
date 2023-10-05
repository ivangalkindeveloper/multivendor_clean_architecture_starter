import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_snackbar.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: InfoSnackBar
class InfoSnackBar extends StatelessWidget {
  const InfoSnackBar({super.key});

  static show(BuildContext context) => showMVSSnackbar(
        context: context,
        child: const InfoSnackBar(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
