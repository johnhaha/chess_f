import 'package:template/constants/configs.dart';
import 'package:template/services/sauce/api.dart';
import 'package:template/services/fastHttp.dart';
import 'package:template/services/sauce/data.dart';

Future<Apply?> makeApply(String campusID, String userID, String toUserID,
    String des, String msgCode) async {
  var url = makeApplyAddr;
  var body = {
    "targetID": campusID,
    "targetType": "campus",
    "userID": userID,
    "toUserID": toUserID,
    "des": des,
    "app": AppName,
    "msgCode": msgCode,
  };
  MakeApplyRes makeApplyRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      makeApplyRes = MakeApplyRes.fromJson(res);
      return makeApplyRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> cancelApply(String applyID) async {
  var url = cancelApplyBaseAddr + "/$applyID";
  MsgRes msgRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<Apply?> getApplyInfo(String applyID) async {
  var url = getApplyInfoABaseddr + "/$applyID";
  GetApplyRes getApplyRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getApplyRes = GetApplyRes.fromJson(res);
      return getApplyRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> approveApply(String applyID) async {
  var url = aproveApplyBaseAddr + "/$applyID";
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

Future<bool> refuseApply(String applyID) async {
  var url = refuseApplyBaseAddr + "/$applyID";
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
