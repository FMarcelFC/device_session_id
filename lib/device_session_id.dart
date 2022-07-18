// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DeviceSessionId {
  @visibleForTesting
  static const methodChannel = MethodChannel('device_session_id');

  static Future<String?> getDeviceID(
      String MERCHANT_ID, String API_KEY, bool productionMode) async {
    final deviceID = await methodChannel.invokeMethod<String>('getDeviceID', {
      'MERCHANT_ID': MERCHANT_ID,
      'API_KEY': API_KEY,
      'productionMode': productionMode
    });
    return deviceID;
  }
}
