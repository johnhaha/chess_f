import 'package:template/constants/configs.dart';

///assets host
// var sugarHost = "$envHost:3007";
// var sugarHost = "https://olive-res.gulu.online";

String get sugarHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3007";
    case EnvType.pre:
      return "https://olive-res.gulu.online";
    case EnvType.prod:
      return "https://res.kuaimai.fun";
  }
}

String get uploadMultipleImagesAddr => sugarHost + "/api/image/multiple";
String get getImageInfoWithFileIDBaseAddr => sugarHost + "/api/image/info";

//post
String get addPostAddr => sugarHost + "/api/post/add";
String get getTargetPostAddr => sugarHost + "/api/post/target";
String get deletePostBaseAddr => sugarHost + "/api/post/delete";

//pic
String get addPicAddr => sugarHost + "/api/pic/add";
String get getPicInfoBaseAddr => sugarHost + "/api/pic/info";
