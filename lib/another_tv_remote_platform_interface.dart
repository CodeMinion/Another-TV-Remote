import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'another_tv_remote_method_channel.dart';

abstract class AnotherTvRemotePlatform extends PlatformInterface {
  /// Constructs a AnotherTvRemotePlatform.
  AnotherTvRemotePlatform() : super(token: _token);

  static final Object _token = Object();

  static AnotherTvRemotePlatform _instance = MethodChannelAnotherTvRemote();

  /// The default instance of [AnotherTvRemotePlatform] to use.
  ///
  /// Defaults to [MethodChannelAnotherTvRemote].
  static AnotherTvRemotePlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnotherTvRemotePlatform] when
  /// they register themselves.
  static set instance(AnotherTvRemotePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
