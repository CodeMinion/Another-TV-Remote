import 'package:flutter_test/flutter_test.dart';
import 'package:another_tv_remote/another_tv_remote.dart';
import 'package:another_tv_remote/another_tv_remote_platform_interface.dart';
import 'package:another_tv_remote/another_tv_remote_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAnotherTvRemotePlatform 
    with MockPlatformInterfaceMixin
    implements AnotherTvRemotePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AnotherTvRemotePlatform initialPlatform = AnotherTvRemotePlatform.instance;

  test('$MethodChannelAnotherTvRemote is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAnotherTvRemote>());
  });

  /*
  test('getPlatformVersion', () async {
    AnotherTvRemote anotherTvRemotePlugin = AnotherTvRemote();
    MockAnotherTvRemotePlatform fakePlatform = MockAnotherTvRemotePlatform();
    AnotherTvRemotePlatform.instance = fakePlatform;
  
    expect(await anotherTvRemotePlugin.getPlatformVersion(), '42');
  });

   */
}
