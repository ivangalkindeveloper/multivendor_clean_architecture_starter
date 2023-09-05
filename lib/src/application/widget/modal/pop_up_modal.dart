import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_modal.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: PopUpModal
class PopUpModal extends StatelessWidget {
  const PopUpModal({
    super.key,
  });

  static show(BuildContext context) => showMVSPopUpModal(
        context: context,
        child: const PopUpModal(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
