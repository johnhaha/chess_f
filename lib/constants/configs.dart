import 'package:hey/configs/app.dart';
import 'package:hey/configs/assets.dart';
import 'package:ku/style/color.dart';
import 'package:ku/style/size.dart';
import 'package:ku/style/theme.dart';
import 'package:flutter/material.dart';

var magicTheme = MagicTheme(magicColor: magicColor, magicSize: magicSize);

var appInfo = AppInfo(
  appName: "snack",
  appVersion: 1.0,
  userAgreeUrl: "https://www.notion.so/d2f1bc8a700f45ada379ef36c7d7fd18",
  privacyUrl: "https://www.notion.so/6b1131230c484441acb8e1fc117601f0",
  jpushAppKey: "jpushAppKey",
  ossImageAddr: 'https://kuaimai-media.oss-cn-shanghai.aliyuncs.com',
  sampleNetImage:
      'https://kuaimai-media.oss-cn-shanghai.aliyuncs.com/sample.png',
  //TODO: add pay call back
  payCallback: 'paycallback',
);

var imageAssets = ImageAssets(imageHost: appInfo.ossImageAddr);

var appHost = ServiceHost(
    testHost: "http://192.168.50.54:8006",
    preHost: "http://192.168.50.54",
    prodHost: "http://10.23.16.203",
    envType: EnvType.test);

var sugarHost = ServiceHost(
    testHost: "http://192.168.50.54:3007",
    preHost: "https://olive-res.gulu.online",
    prodHost: "https://res.kuaimai.fun",
    envType: EnvType.test);

var forkHost = ServiceHost(
    testHost: "http://192.168.50.54:3111",
    preHost: "https://olive-fork.gulu.online",
    prodHost: "https://fork.kuaimai.fun",
    envType: EnvType.test);

var magicSize = MagicSize(tBase: 14, xBase: 12);
var magicColor = MagicColor(
    red: const Color(0xFFF15E27),
    colorful: const Color(0xFF3165D5),
    black: const Color(0xFF262D40),
    highlight: const Color(0xFF20BFC3),
    white: const Color(0xFFF3F5F7),
    colorfulReverse: false);
