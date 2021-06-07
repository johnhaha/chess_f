import 'package:template/services/bean/api.dart';
import 'package:template/services/fastHttp.dart';

import 'data.dart';

Future<Study?> addStudy(String userID, String campusID, String applyID) async {
  var url = addStudyAddr;
  var body = {
    "userID": userID,
    "campusID": campusID,
    "applyID": applyID,
  };
  AddStudyRes addStudyRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      addStudyRes = AddStudyRes.fromJson(res);
      return addStudyRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<int> checkUserStudyStatus(String userID, String campusID) async {
  var url = checkUserStudyStatusAddr;
  var body = {"userID": userID, "campusID": campusID};
  CheckUserStudyStatusRes checkUserStudyStatusRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      checkUserStudyStatusRes = CheckUserStudyStatusRes.fromJson(res);
      print(checkUserStudyStatusRes.message);
      return checkUserStudyStatusRes.data ?? 0;
    }
  } catch (e) {
    print(e);
  }
  return 0;
}

Future<bool> approveStudy(String applyID, DateTime endDate) async {
  var url = approveStudyBaseAddr + "/$applyID";
  MsgRes msgRes;
  var endDateStr = endDate.toUtc().toIso8601String();
  print(endDateStr);
  var body = {"endDate": endDateStr};
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      print(msgRes.message);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> refuseStudy(String applyID) async {
  var url = refuseStudyBaseAddr + "/$applyID";
  MsgRes msgRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      print(msgRes.message);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<List<Study>?> getUserStudies(String userID) async {
  var url = getUserStudyBaseAddr + "/$userID";
  GetUserStudiesRes getUserStudiesRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getUserStudiesRes = GetUserStudiesRes.fromJson(res);
      print(getUserStudiesRes.message);
      return getUserStudiesRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<List<Study>?> getUserCurrentStudies(String userID) async {
  var url = getUserCurrentStudyBaseAddr + "/$userID";
  GetUserStudiesRes getUserStudiesRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getUserStudiesRes = GetUserStudiesRes.fromJson(res);
      print(getUserStudiesRes.message);
      return getUserStudiesRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<Study?> getStudyInfo(String sid) async {
  var url = getStudyInfoBaseAddr + "/$sid";
  GetStudyInfoRes getStudyInfoRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getStudyInfoRes = GetStudyInfoRes.fromJson(res);
      return getStudyInfoRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> finishStudy(String sid) async {
  var url = finishStudyBaseAddr + "/$sid";
  MsgRes msgRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      print(msgRes.message);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> cancelStudy(String sid) async {
  var url = cancelStudyBaseAddr + "/$sid";
  MsgRes msgRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      print(msgRes.message);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> cancelStudyWithUserID(String campusID, String userID) async {
  var url = cancelStudyWithUserIDAddr;
  var body = {"campusID": campusID, "userID": userID};
  MsgRes msgRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      print(msgRes.message);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}
