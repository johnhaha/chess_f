import 'package:pump/pump.dart';
import 'package:chess/constants/configs.dart';

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

String getCurrentIP() {
  switch (sharedEnv) {
    case EnvType.pre:
      return preHostIP;
    case EnvType.test:
      if (sharedIsLocal) {
        return localhost;
      } else {
        return machost;
      }
    case EnvType.prod:
      return preHostIP;
  }
}
