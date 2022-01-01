import 'package:hey/configs/app.dart';
import 'package:pump/shared.dart';

import 'configs.dart';

var appConnection = AppConnection(
  app: appHost,
  envType: sharedEnv,
);

var appInfo = AppInfo(
  userAgreeUrl:
      "https://open-info.notion.site/e1dd7df3322c4979a83fe1f784fbaed8",
  privacyUrl: "https://open-info.notion.site/b8d9a9f4873f404e8ac19ae98ab4e8db",
  inviteOnly: false,
);
