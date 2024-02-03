import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mvs_widget_method_channel.dart';

abstract class MvsWidgetPlatform extends PlatformInterface {
  /// Constructs a MvsWidgetPlatform.
  MvsWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static MvsWidgetPlatform _instance = MethodChannelMvsWidget();

  /// The default instance of [MvsWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelMvsWidget].
  static MvsWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MvsWidgetPlatform] when
  /// they register themselves.
  static set instance(MvsWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
