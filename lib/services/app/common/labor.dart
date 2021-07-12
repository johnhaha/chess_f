import 'package:template/constants/info.dart';
import 'package:template/data/common/labor.dart';
import 'package:template/services/app/common/api.dart';
import 'package:template/services/app/common/res.dart';
import 'package:template/utility/fastHttp.dart';

class LaborService {
  static Future<bool> updateUserLaborTime(
      String userID, int start, int end) async {
    var url = updateUserLaborTimeAddr;
    var body = {"start": start, "end": end, "userID": userID, "app": AppName};
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

  static Future<bool> updateUserLaborPlace(
      String userID, String placeID) async {
    var url = updateUserLaborPlaceAddr;
    var body = {"placeID": placeID, "userID": userID, "app": AppName};
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

  static Future<LaborForce?> getUserLaborForce(String userID) async {
    var url = getUserLaborForceBaseAddr + userID;
    GetUserLaborForceRes getUserLaborForceRes;
    try {
      var res = await fastGet(url);
      if (res != null) {
        getUserLaborForceRes = GetUserLaborForceRes.fromJson(res);
        print(getUserLaborForceRes.message);
        return getUserLaborForceRes.data;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<LaborPlace?> getUserLaborPlace(String userID) async {
    var url = getUserLaborPlaceBaseAddr + userID;
    GetUserLaborPlaceRes getUserLaborPlaceRes;
    try {
      var res = await fastGet(url);
      if (res != null) {
        getUserLaborPlaceRes = GetUserLaborPlaceRes.fromJson(res);
        print(getUserLaborPlaceRes.data);
        return getUserLaborPlaceRes.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
