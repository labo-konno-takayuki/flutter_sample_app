import 'package:flutter/services.dart';

class PluginWindowChannel {
  static const platform = MethodChannel('com.example.flutter.view/plugin');

  static Future<void> callOpenPlatformWindow() async {
    try {
      await platform.invokeMethod("openPlatformWindow");
    } on PlatformException catch (e) {
      rethrow;
    }
  }
}