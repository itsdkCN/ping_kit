
import 'dart:async';

import 'package:flutter/services.dart';

class PingKit {
  static const MethodChannel _channel =
      const MethodChannel('cn.itsdk.ping_kit');

  static Future<String> getPingDelay(String ip) async {
    final String result =
    await _channel.invokeMethod("getPingDelay", {"ip": ip, "timer": 3});
    return result;
  }
}
