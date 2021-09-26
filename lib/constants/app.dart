import 'package:hey/configs/app.dart';
import 'package:hole/media.dart';
import 'package:ku/api/define.dart';

import 'configs.dart';

var appConnection = AppConnection(
    app: appHost,
    userOnline: userOnlineHost,
    subRelationOnline: subRelationOnlineHost,
    envType: EnvType.test);

var appInfo = AppInfo(
  appName: "snack",
  appVersion: 1.0,
  userAgreeUrl: "https://www.notion.so/d2f1bc8a700f45ada379ef36c7d7fd18",
  privacyUrl: "https://www.notion.so/6b1131230c484441acb8e1fc117601f0",
  jpushAppKey: "jpushAppKey",
  inviteOnly: false,
);

var mediaAssets = MediaAssets(mediaHost: 'http://asset.kuiamai.fun');
