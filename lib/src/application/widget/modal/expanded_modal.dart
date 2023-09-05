import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_modal.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: ExpandedModal
class ExpandedModal extends StatelessWidget {
  const ExpandedModal({
    super.key,
  });

  static show(BuildContext context) => showMVSExpandedModal(
        context: context,
        child: const ExpandedModal(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
