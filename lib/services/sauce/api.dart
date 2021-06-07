import 'package:template/constants/configs.dart';

///tools host
// var sauceHost = "$envHost:3012";
// var sauceHost = "https://olive-sauce.gulu.online";

String get sauceHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3012";
    case EnvType.pre:
      return "https://olive-sauce.gulu.online";
    case EnvType.prod:
      return "https://sauce.kuaimai.fun";
  }
}

var makeApplyAddr = sauceHost + "/api/apply/add";
var getApplyInfoABaseddr = sauceHost + "/api/apply/info";
var cancelApplyBaseAddr = sauceHost + "/api/apply/cancel";
var aproveApplyBaseAddr = sauceHost + "/api/apply/approve";
var refuseApplyBaseAddr = sauceHost + "/api/apply/refuse";
