import 'package:template/constants/configs.dart';

///app host
// var beanHost = "$envHost:8013";
// var beanHost = "https://olive-bean.gulu.online";

String get beanHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:8013";
    case EnvType.pre:
      return "https://olive-bean.gulu.online";
    case EnvType.prod:
      return "https://bean.kuaimai.fun";
  }
}

//campus
var getUserCampusBaseAddr = beanHost + "/api/campus/user";
var getCampusWithCampusIDBaseAddr = beanHost + "/api/campus/info";
var getCampusStudyNumBaseAddr = beanHost + "/api/campus/study-num";
var getUserDetailCampusBaseAddr = beanHost + "/api/campus/user-detail";
var getUserCampusWithNumBaseAddr = beanHost + "/api/campus/user-campus";
var updateCampusNoticeAddr = beanHost + "/api/campus/notice/update";

//study
var addStudyAddr = beanHost + "/api/study/add";
var getUserStudyBaseAddr = beanHost + "/api/study/user";
var getStudyInfoBaseAddr = beanHost + "/api/study/info";
var getUserCurrentStudyBaseAddr = beanHost + "/api/study/user-current";
var approveStudyBaseAddr = beanHost + "/api/study/approve";
var refuseStudyBaseAddr = beanHost + "/api/study/refuse";
var checkUserStudyStatusAddr = beanHost + "/api/study/check/user-status";
var finishStudyBaseAddr = beanHost + "/api/study/finish";
var cancelStudyBaseAddr = beanHost + "/api/study/cancel";
var cancelStudyWithUserIDAddr = beanHost + "/api/study/user-cancel";
