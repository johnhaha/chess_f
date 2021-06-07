import 'package:template/constants/configs.dart';

///user host
// var waterHost = "$envHost:3009";
// var waterHost = "https://olive-water.gulu.online";

String get waterHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3009";
    case EnvType.pre:
      return "https://olive-water.gulu.online";
    case EnvType.prod:
      return "https://water.kuaimai.fun";
  }
}

var userLoginAddr = waterHost + "/api/login";

var userSignoutAddr = waterHost + "/api/signout";

var loginCheckCodeAddr = waterHost + "/api/checkCode";

var tokenLoginAddr = waterHost + "/api/token";

var getUserInfoBaseAddr = waterHost + "/api/info/get";

var updateUserInfoBaseAddr = waterHost + "/api/info/update";

var getManyUsersAddr = waterHost + "/api/info/many";

var searchUserAddr = waterHost + "/api/search";

var getOrderedUserBaseAddr = waterHost + "/api/order";
