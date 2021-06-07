import 'package:template/constants/configs.dart';

///paymenmt host
// var grillHost = "$envHost:3008";
// var grillHost = "https://olive-pay.gulu.online";

String get grillHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3008";
    case EnvType.pre:
      return "https://olive-pay.gulu.online";
    case EnvType.prod:
      return "https://pay.kuaimai.fun";
  }
}

var makeOrderAddr = grillHost + "/api/order/add";
var getUserCurrentOrderAddr = grillHost + "/api/order/user/current";
var getUserOrderAddr = grillHost + "/api/order/user";
var updateOrderStatusAddr = grillHost + "/api/order/status/update";
var cancelOrderBaseAddr = grillHost + "/api/order/cancel";
var finishOrderBaseAddr = grillHost + "/api/order/finish";
