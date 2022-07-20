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
  @override
  void initState() {
    super.initState();
    initDeviceSession();
  }

  Future<void> initDeviceSession() async {
    String deviceID;
    const String merchantID =
        '<<MERCHANT_ID>>'; // REPLACE THIS WITH YOUR MERCHANT ID
    const String apiKey = '<<API_KEY>>'; // REPLACE THIS WITH YOUR API KEY
    const bool productionMode =
        true; // REPLACE THIS IF YOU ARE NOT ON PRODUCTION MODE
    try {
      deviceID = await DeviceSessionId.getDeviceID(
              merchantID, apiKey, productionMode) ??
          'Error getting the device session id';
    } catch (e) {
      deviceID = 'Error getting the device session id';
    }

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
