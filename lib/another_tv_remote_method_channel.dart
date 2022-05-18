import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'another_tv_remote_platform_interface.dart';

/// An implementation of [AnotherTvRemotePlatform] that uses method channels.
class MethodChannelAnotherTvRemote extends AnotherTvRemotePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('another_tv_remote');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
