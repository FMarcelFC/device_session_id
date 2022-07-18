package com.example.device_session_id;

import androidx.annotation.NonNull;
import android.app.Activity;

import mx.openpay.android.Openpay;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** DeviceSessionIdPlugin */
public class DeviceSessionIdPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  private Activity activity;
  private MethodChannel channel;
  private Openpay openpay;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "device_session_id");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    if (call.method.equals("getDeviceID")) {
      this.openpay = new Openpay((String) call.argument("MERCHANT_ID"), (String) call.argument("API_KEY"), (boolean) call.argument("productionMode"));
      String deviceIdString = openpay.getDeviceCollectorDefaultImpl().setup(this.activity);
      result.success(deviceIdString);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding){
    this.activity = binding.getActivity();
  }
  @Override
  public void onDetachedFromActivity(){
    this.activity = null; }
  @Override
  public void onDetachedFromActivityForConfigChanges(){
    this.activity = null; }
  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding){
    this.activity = binding.getActivity(); }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
