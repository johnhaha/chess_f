import 'package:hey/configs/app.dart';
import 'package:pump/shared.dart';

import 'configs.dart';

var appConnection = AppConnection(
  app: appHost,
  envType: sharedEnv,
);

var appInfo = AppInfo(
  userAgreeUrl: "https://www.notion.so/d2f1bc8a700f45ada379ef36c7d7fd18",
  privacyUrl: "https://www.notion.so/6b1131230c484441acb8e1fc117601f0",
  inviteOnly: false,
);
