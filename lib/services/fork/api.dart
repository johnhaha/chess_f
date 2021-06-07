import 'package:template/constants/configs.dart';

///feedback host
// var forkHost = "$envHost:3111";
// var forkHost = "https://olive-fork.gulu.online";

String get forkHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3111";
    case EnvType.pre:
      return "https://olive-fork.gulu.online";
    case EnvType.prod:
      return "https://fork.kuaimai.fun";
  }
}

var addFeedbackAddr = forkHost + "/api/feedback/add";

//report
var addReportAddr = forkHost + "/api/report/add";
