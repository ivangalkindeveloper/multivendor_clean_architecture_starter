import 'package:multi_vendor_starter/src/presentation/component/global/mvs_modal.dart';
import 'package:flutter/widgets.dart';

class ExpandedModal extends StatelessWidget {
  const ExpandedModal({
    super.key,
  });

  static show({
    required BuildContext context,
  }) =>
      showMVSExpandedModal(
        context: context,
        child: const ExpandedModal(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
