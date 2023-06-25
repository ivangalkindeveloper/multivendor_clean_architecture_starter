import 'package:flutter_gen/gen_l10n/application_localization.dart';
import 'package:flutter/widgets.dart';

extension StringNullableExtension on String? {}

extension StringExtension on String {}

extension BuildContextExtension on BuildContext {
  ApplicationLocalization get l10n => ApplicationLocalization.of(this);
}
