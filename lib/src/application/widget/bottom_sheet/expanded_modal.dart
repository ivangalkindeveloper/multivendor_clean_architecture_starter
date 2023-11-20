import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_bottom_sheet.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: ExpandedBottomSheet
class ExpandedBottomSheet extends StatelessWidget {
  const ExpandedBottomSheet({
    super.key,
  });

  static show(BuildContext context) => showMVSExpandedBottomSheet(
        context: context,
        child: const ExpandedBottomSheet(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
