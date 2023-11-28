import 'package:flutter/services.dart';

class PluginChannel {
  static const platform = MethodChannel('com.example.flutter/plugin');

  static Future<String?> callMethodA() async {
    String? result = '';

    try {
      result = await platform.invokeMethod("methodA");
    } on PlatformException catch (e) {
      result = e.message;
    }

    return result;
  }
}