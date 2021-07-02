import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:template/data/common/message.dart';
import 'package:template/handlers/push.dart';
import 'package:plain_notification_token/plain_notification_token.dart';
import 'package:template/services/app/common/push.dart';

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
  print(Platform.isIOS ? "ios" : "others");
  if (Platform.isIOS) {
    plainNotificationToken.requestPermission();
    await plainNotificationToken.onIosSettingsRegistered.first;
    token = await plainNotificationToken.getToken();
    return token;
  }
  return token;
}

Future<String?> registerUserDevice(String userID) async {
  String? token;
  print(Platform.isAndroid ? "是安卓" : "不是安卓");
  if (Platform.isIOS) {
    var plainNotificationToken = PlainNotificationToken();
    plainNotificationToken.requestPermission();

    // If you want to wait until Permission dialog close,
    // you need wait changing setting registered.
    await plainNotificationToken.onIosSettingsRegistered.first;
    token = await plainNotificationToken.getToken();
    if (token != null) {
      await addPushDevice(userID, token, PushChanel.ios, PushSupplier.apple);
    }
  } else if (Platform.isAndroid) {
    print("yeah registering android push id");
    token = await getJpushDeviceID();
    await addPushDevice(userID, token, PushChanel.android, PushSupplier.jpush);
  }
  print("token是$token");
  return token;
}
