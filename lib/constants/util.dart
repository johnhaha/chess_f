import 'package:pump/pump.dart';
import 'package:template/constants/configs.dart';

String getCurrentHost() {
  switch (sharedEnv) {
    case EnvType.pre:
      return preHostName;
    case EnvType.test:
      if (sharedIsLocal) {
        return localhost;
      } else {
        return machost;
      }
    case EnvType.prod:
      return preHostName;
  }
}
