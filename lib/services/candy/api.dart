import 'package:template/constants/configs.dart';

///interact host
// var candyHost = "$envHost:3030";
// var candyHost = "https://olive-candy.gulu.online";

String get candyHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3030";
    case EnvType.pre:
      return "https://olive-candy.gulu.online";
    case EnvType.prod:
      return "https://candy.kuaimai.fun";
  }
}

var rateAddr = candyHost + "/api/rate/add";
var getTargetRatesAddr = candyHost + "/api/rate/target";

//like
var addLikeAddr = candyHost + "/api/like/add";
var cancelLikeBaseAddr = candyHost + "/api/like/cancel";
var checkLikeAddr = candyHost + "/api/like/check";

//follow
var addFollowAddr = candyHost + "/api/follow/add";
var checkFollowAddr = candyHost + "/api/follow/check";
var cancelFollowBaseAddr = candyHost + "/api/follow/cancel";

//comment
var addCommentAddr = candyHost + "/api/comment/add";
var getTargetCommentAddr = candyHost + "/api/comment/target";
var deleteCommnetBaseAddr = candyHost + "/api/comment/delete";
var getManyTargetsCommentNumAddr = candyHost + "/api/comment/target-count/many";
