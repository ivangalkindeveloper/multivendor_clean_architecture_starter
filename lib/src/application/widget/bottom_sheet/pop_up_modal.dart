import 'package:multivendor_clean_architecture_starter/src/application/widget/component/global/mvs_bottom_sheet.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: PopUpBottomSheet
class SmallBottomSheet extends StatelessWidget {
  const SmallBottomSheet({
    super.key,
  });

  static show(BuildContext context) => showMVSSmallBottomSheet(
        context: context,
        child: const SmallBottomSheet(),
      );

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
