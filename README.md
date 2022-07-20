# Openpay Device Session ID
This package integrates the [Openpay iOS](https://github.com/open-pay/openpay-swift-ios "Openpay iOS") and [Openpay Android](https://github.com/open-pay/openpay-android "Openpay Android") libraries to generate the Device Session ID used in the Openpay [Anti-Fraud System](https://documents.openpay.mx/docs/fraud-tool.html "Anti-Fraud System") for the card payments through their [API.](https://documents.openpay.mx/docs/api/ "API.")

````

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
              'Error getting the device session id'; // THE DEVICE SESSION ID IS OBTAINED
        } catch (e) {
          deviceID = 'Error getting the device session id';
        }
        setState(() {
          // THIS IS WHERE THE ID IS STORED
          _deviceID = deviceID;
        });
      }
````
You can use this ID in your json to process the card payments.