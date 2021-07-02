import 'package:flutter/services.dart';
import 'package:template/constants/configs.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'dart:io';

Future<JPush> jpushInit({required Function onReceive}) async {
  var jpush = JPush();
  try {
    jpush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
      print("flutter onReceiveNotification: $message");
      onReceive();
    }, onOpenNotification: (Map<String, dynamic> message) async {
      print("flutter onOpenNotification: $message");
    }, onReceiveMessage: (Map<String, dynamic> message) async {
      print("flutter onReceiveMessage: $message");
    }, onReceiveNotificationAuthorization:
            (Map<String, dynamic> message) async {
      print("flutter onReceiveNotificationAuthorization: $message");
    });
  } on PlatformException {
    print('Failed to get platform version.');
  }

  if (Platform.isAndroid) {
    jpush.setup(
      appKey: JpushAppKey, //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
  }

  // jpush.applyPushAuthority(
  //     NotificationSettingsIOS(sound: true, alert: true, badge: true));

  // Platform messages may fail, so we use a try/catch PlatformException.
  // jpush.getRegistrationID().then((rid) {
  //   print("flutter get registration id : $rid");
  // });
  return jpush;
}

JPush newJpush({isProduction = false}) {
  var jpush = JPush();
  jpush.setup(
    appKey: JpushAppKey, //你自己应用的 AppKey
    channel: "theChannel",
    production: isProduction,
    debug: !isProduction,
  );
  return jpush;
}

Future<String> getJpushDeviceID() async {
  var jpush = newJpush();
  var token = await jpush.getRegistrationID();
  print("token 是" + token);
  return token;
}
