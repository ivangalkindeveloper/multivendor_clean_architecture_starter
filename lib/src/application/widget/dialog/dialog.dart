import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_dialog.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: Dialog
class Dialog extends StatelessWidget {
  const Dialog({
    super.key,
  });

  static show(BuildContext context) => showMVSDialog(
        context: context,
        child: const Dialog(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
