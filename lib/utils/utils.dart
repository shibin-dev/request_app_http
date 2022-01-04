import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class Tester {
  static void sPrint(String data) {
    if (data == null) {
      data = "nil";
    }
    if (kReleaseMode) {
    } else {
      print("$data");
    }
  }
}

class Utils {
  static dynamic getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      return "web:{"
              "userAgent:${webInfo.userAgent}, "
              "vendor:${webInfo.vendor}, "
              "memory:${webInfo.deviceMemory}}"
          .replaceAll("'", "");
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return "ios:{"
              "model:${iosDeviceInfo.model}, "
              "version:${iosDeviceInfo.systemVersion}}"
          .replaceAll("'", "");
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return "android:{"
              "model:${androidDeviceInfo.model}, "
              "device:${androidDeviceInfo.device}, "
              "version${androidDeviceInfo.version.sdkInt}}"
          .replaceAll("'", "");
    }
  }
}
