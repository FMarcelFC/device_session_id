// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DeviceSessionId {
  @visibleForTesting
  static const methodChannel = MethodChannel(
      'device_session_id'); // METHOD FOR CALLING THE NATIVE CODE LIBRARIES

  static Future<String?> getDeviceID(
      String MERCHANT_ID, String API_KEY, bool productionMode) async {
    final deviceID = await methodChannel.invokeMethod<String>('getDeviceID', {
      'MERCHANT_ID': MERCHANT_ID, // MERCHANT ID GIVEN BY OPENPAY
      'API_KEY': API_KEY, // API KEY GIVEN BY OPENPAY
      'productionMode': productionMode // PRODUCTION MODE OR DEBUG MODE
    });
    return deviceID; // RETURNS DEVICE SESSION ID AFTER RUNNING THROUGH OPENPAY LIBRARIES
  }
}
