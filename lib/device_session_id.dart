// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// [DeviceSessionId] is the class that allows you to get the ID from Openpay needed for your card payments.
class DeviceSessionId {
  @visibleForTesting

  /// The [methodChannel] connects to the Openpay libraries to use native code.
  static const methodChannel = MethodChannel('device_session_id');

  /// The [getDeviceID] method uses the [MERCHANT_ID] and [API_KEY] provided by Openpay to get the Device Session ID and return it in the [deviceID] variable as a String.
  static Future<String?> getDeviceID(
      String MERCHANT_ID, String API_KEY, bool productionMode) async {
    final deviceID = await methodChannel.invokeMethod<String>('getDeviceID', {
      'MERCHANT_ID': MERCHANT_ID,
      'API_KEY': API_KEY,
      'productionMode': productionMode
    });
    return deviceID; // RETURNS DEVICE SESSION ID AFTER RUNNING THROUGH OPENPAY LIBRARIES
  }
}
