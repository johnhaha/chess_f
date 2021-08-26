import 'package:hey/configs/app.dart';
import 'package:hole/images.dart';
import 'package:ku/api/define.dart';

import 'configs.dart';

var appConnection = AppConnection(
    app: appHost,
    sugar: sugarHost,
    userOnline: userOnlineHost,
    subRelationOnline: subRelationOnlineHost,
    envType: EnvType.test);

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
