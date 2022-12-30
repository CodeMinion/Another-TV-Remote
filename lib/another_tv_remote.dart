import 'package:flutter/services.dart';

import 'another_tv_remote_platform_interface.dart';

class AnotherTvRemote {

  static const MethodChannel _channel = MethodChannel('another_tv_remote');

  static const EventChannel _tvRemoteEventChannel =
      EventChannel("another_tv_remote_input");

  /// Register for TV Remote button events.
  static Stream<TvRemoteEvent> getTvRemoteEvents() async* {
    yield* _tvRemoteEventChannel.receiveBroadcastStream().map((buffer) =>
        TvRemoteEvent(keyCode: buffer["keyCode"] as int, type: KeyType.fromName(name: buffer["type"]), action: KeyAction.fromName(name: buffer["action"])));
  }
}

enum KeyType {
  unknown,
  ok,
  //play,
  back,
  fastForward,
  rewind,
  skipForward,
  skipBackward,
  dPadUp,
  dPadDown,
  dPadLeft,
  dPadRight;

  static KeyType fromName({required String name}) {
    for (var value in values) {
      if (value.toShortString() == name) {
        return value;
      }
    }
    return KeyType.unknown;
  }

  String toShortString() {
    return toString().split('.').last;
  }
}

enum KeyAction {
  unknown, down, up;

  static KeyAction fromName({required String name}) {
    for (var value in values) {
      if (value.toShortString() == name) {
        return value;
      }
    }
    return KeyAction.unknown;
  }

  String toShortString() {
    return toString().split('.').last;
  }
}

class TvRemoteEvent {
  const TvRemoteEvent({required this.keyCode, required this.type, required this.action});

  final int keyCode;
  final KeyType type;
  final KeyAction action;

  String toString() {
    return "KeyCode: $keyCode Key: $type - Action: $action";
  }
}
