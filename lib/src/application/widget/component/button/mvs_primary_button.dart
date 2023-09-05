import 'package:flutter_platform_component/flutter_platform_component.dart';
import 'package:flutter/widgets.dart';

//TODO Starter: MVSPrimaryButton
class MVSPrimaryButton extends StatelessWidget {
  const MVSPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isLoading,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FPCPrimaryButton(
      title: this.title,
      onPressed: this.onPressed,
      isLoading: this.isLoading,
    );
  }
}
