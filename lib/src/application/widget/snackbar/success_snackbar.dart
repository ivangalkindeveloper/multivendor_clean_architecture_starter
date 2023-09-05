import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_snackbar.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: SuccessSnackbar
class SuccessSnackbar extends StatelessWidget {
  const SuccessSnackbar({super.key});

  static show(BuildContext context) => showMVSSnackbar(
        context: context,
        child: const SuccessSnackbar(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
