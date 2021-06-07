import 'package:template/constants/configs.dart';

///message host
// var sushiHost = "$envHost:3010";
// var sushiHost = "https://olive-res.gulu.online";

String get sushiHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3010";
    case EnvType.pre:
      return "https://olive-sushi.gulu.online";
    case EnvType.prod:
      return "https://sushi.kuaimai.fun";
  }
}

var getUserMsgAddr = sushiHost + "/api/msg/user";

const ApplyMsgCode = "template1";

//push
var addPushDeviceAddr = sushiHost + "/api/push/device/new";
