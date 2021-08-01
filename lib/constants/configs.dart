import 'package:hey/configs/app.dart';
import 'package:hey/services/sugar/assets.dart';
import 'package:ku/style/color.dart';
import 'package:ku/style/size.dart';
import 'package:ku/style/theme.dart';
import 'package:flutter/material.dart';

var sugarAsset = SugarAssets(sugarHost: sugarHost.host);

var appTheme = AppTheme(appColor, appSize);

var appInfo = AppInfo(
  appName: "template",
  appVersion: 1.0,
  userAgreeUrl: "https://www.notion.so/d2f1bc8a700f45ada379ef36c7d7fd18",
  privacyUrl: "https://www.notion.so/6b1131230c484441acb8e1fc117601f0",
  jpushAppKey: "jpushAppKey",
  ossImageAddr: 'https://kuaimai-media.oss-cn-shanghai.aliyuncs.com',
  sampleNetImage: 'sample.png',
);

var appHost = ServiceHost(
    testHost: "http://localhost",
    preHost: "http://192.168.50.54",
    prodHost: "http://10.23.16.203",
    envType: EnvType.test);

var sugarHost = ServiceHost(
    testHost: "http://localhost:3007",
    preHost: "https://olive-res.gulu.online",
    prodHost: "https://res.kuaimai.fun",
    envType: EnvType.test);

var forkHost = ServiceHost(
    testHost: "http://localhost:3111",
    preHost: "https://olive-fork.gulu.online",
    prodHost: "https://fork.kuaimai.fun",
    envType: EnvType.test);

var appColor = AppColor(
    MainColor: const Color(0xFF3B71FE),
    AlertColor: const Color(0xFFF86C59),
    NoticeColor: const Color(0xFF58C37D),
    PageColor: const Color(0xFFFFFFFF),
    HighLightColor: const Color(0xFFFFD167),
    ClickColor: const Color(0xFF242630),
    LineColor: const Color(0xFFE7E7EA),
    ShadowColor: const Color(0xFFEAEAE9),
    TextColor: const Color(0xFF242630),
    DisColor: const Color(0xFF8E9096),
    CardWhiteColor: const Color(0xFFF3F5F7),
    CardHLColor1: const Color(0xFFD3EFDC),
    CardHLColor2: const Color(0xFFE8F7E0));

var appSize = AppSize(
  TitleSize1: 48.0,
  TitleSize2: 32.0,
  TitleSize3: 24.0,

  //avatar radius
  AvatarRadius1: 64.0,
  AvatarRadius2: 24.0,
  AvatarRadius3: 12.0,

  //avatar
  AvatarSize1: 128.0,
  AvatarSize2: 48.0,
  AvatarSize3: 24.0,
  //image
  ImageSize1: 168.0,
  ImageSize2: 128.0,
  ImageSize3: 48.0,

  //icon
  IconSize1: 48.0,
  IconSize2: 32.0,
  IconSize3: 16.0,
  //radius
  BorderRadiusSize1: 32.0,
  BorderRadiusSize2: 24.0,
  BorderRadiusSize3: 12.0,
  PaddingSize1: 24.0,
  PaddingSize2: 12.0,
  PaddingSize3: 8.0,
  //text size
  BodySize1: 18.0,
  BodySize2: 14.0,
  //margin
  MarginSize1: 24.0,
  MarginSize2: 12.0,
  ButtonWidth1: 160.0,
  ButtonHeight1: 48.0,
  ButtonWidth2: 70.0,
  ButtonHeight2: 30.0,
  //input
  inputHeight1: 150,
  inputHeight2: 60,
);
