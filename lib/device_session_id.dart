// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DeviceSessionId {
  @visibleForTesting
  static const methodChannel = MethodChannel('device_session_id');

  /// MAIN METHOD FOR GETTING THE DEVICE SESSION ID
  /// THE [MERCHANT_ID] AND [API_KEY] ARE GIVEN BY OPENPAY
  /// THE [productionMode] INDICATES IF THE PROCESS WILL BE EXECUTED IN DEBUGGING OR PRODUCTION MODE
  /// THE [deviceID] STORES THE DEVICE SESSION ID AND RETURNS IT
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
