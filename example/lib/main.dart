import 'package:device_session_id/device_session_id.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _deviceID = '';
  static const String merchantID =
      'mpzmfkrdzp0phiivoyhx'; // REPLACE THIS WITH YOUR MERCHANT ID
  static const String apiKey =
      'pk_6ae46106fba94a6fa8f3dc140fce0c32'; // REPLACE THIS WITH YOUR API KEY
  static const bool productionMode =
      true; // REPLACE THIS IF YOU ARE NOT ON PRODUCTION MODE
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String deviceID;

    try {
      deviceID = await DeviceSessionId.getDeviceID(
              merchantID, apiKey, productionMode) ??
          'Error getting the device session id';
    } catch (e) {
      deviceID = 'Error getting the device session id';
    }

    if (!mounted) return;

    setState(() {
      // THIS IS WHERE THE ID IS STORED
      _deviceID = deviceID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OpenPay device session id'),
        ),
        body: Center(
          child: Text('ID : $_deviceID\n'), // THIS IS WHERE THE ID IS SHOWED
        ),
      ),
    );
  }
}
