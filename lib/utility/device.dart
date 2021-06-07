import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:plain_notification_token/plain_notification_token.dart';

Future<Device> getDevideInfo() async {
  var deviceInfo = DeviceInfoPlugin();
  var device = Device();
  if (Platform.isIOS) {
    var iosInfo = await deviceInfo.iosInfo;
    device.name = iosInfo.utsname.machine;
    device.os = iosInfo.systemVersion;
    device.platform = "iOS";
  } else if (Platform.isAndroid) {
    var androidInfo = await deviceInfo.androidInfo;
    device.name = androidInfo.model;
    device.os = androidInfo.version.release;
    device.platform = "Android";
  }
  return device;
}

class Device {
  String name = "unkwon";
  String os = "unkwon";
  String platform = "unknown";
}

Future<String?> getApnDeviceID() async {
  final plainNotificationToken = PlainNotificationToken();
  String? token;
  if (Platform.isIOS) {
    plainNotificationToken.requestPermission();
    await plainNotificationToken.onIosSettingsRegistered.first;
    token = await plainNotificationToken.getToken();
  }
  return token;
}
