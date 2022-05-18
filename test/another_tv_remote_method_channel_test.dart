import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:another_tv_remote/another_tv_remote_method_channel.dart';

void main() {
  MethodChannelAnotherTvRemote platform = MethodChannelAnotherTvRemote();
  const MethodChannel channel = MethodChannel('another_tv_remote');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
