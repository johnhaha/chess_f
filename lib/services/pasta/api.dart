import 'package:template/constants/configs.dart';

///suggest host
// var pastaHost = "$envHost:3141";
// var pastaHost = "https://olive-pasta.gulu.online";

String get pastaHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3141";
    case EnvType.pre:
      return "https://olive-pasta.gulu.online";
    case EnvType.prod:
      return "https://pasta.kuaimai.fun";
  }
}

var getPastaItemsAddr = pastaHost + "/item/type";

//search
var searchAddr = pastaHost + "/item/search";
