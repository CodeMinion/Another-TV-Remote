import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:another_tv_remote/another_tv_remote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _latestTvRemoteEvent = '';

  @override
  void initState() {
    super.initState();
    AnotherTvRemote.getTvRemoteEvents().listen((event) => {
        log('AnotherTvRemote event: $event'),
        setState(() {
          _latestTvRemoteEvent = event.toString();
        })
      });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Android TV Remote'),
        ),
        body: Center(
          child: Text('Press any key.. \n\n$_latestTvRemoteEvent\n'),
        ),
      ),
    );
  }
}
