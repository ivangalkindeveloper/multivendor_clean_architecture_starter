import 'package:multi_vendor_starter/src/presentation/component/global/mvs_modal.dart';
import 'package:flutter/widgets.dart';

class PopUpModal extends StatelessWidget {
  const PopUpModal({
    super.key,
  });

  static show({
    required BuildContext context,
  }) =>
      showMVSPopUpModal(
        context: context,
        child: const PopUpModal(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
