import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_snackbar.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: InfoSnackbar
class InfoSnackbar extends StatelessWidget {
  const InfoSnackbar({super.key});

  static show(BuildContext context) => showMVSSnackbar(
        context: context,
        child: const InfoSnackbar(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
