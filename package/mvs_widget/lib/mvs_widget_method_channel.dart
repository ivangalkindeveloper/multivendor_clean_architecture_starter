import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mvs_widget_platform_interface.dart';

/// An implementation of [MvsWidgetPlatform] that uses method channels.
class MethodChannelMvsWidget extends MvsWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mvs_widget');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
