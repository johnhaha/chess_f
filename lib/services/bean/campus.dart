import 'package:template/services/bean/api.dart';
import 'package:template/services/fastHttp.dart';

import 'data.dart';

Future<Campus?> getUserCampus(String userID) async {
  var url = getUserCampusBaseAddr + "/$userID";
  GetUserCampusRes getUserCampusRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getUserCampusRes = GetUserCampusRes.fromJson(res);
      print(getUserCampusRes.message);
      return getUserCampusRes.data;
    }
  } catch (e) {}
}

Future<int> getCampusStudyNum(String campusID) async {
  var url = getCampusStudyNumBaseAddr + "/$campusID";
  GetCampusStudiesNumRes getCampusStudiesNumRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getCampusStudiesNumRes = GetCampusStudiesNumRes.fromJson(res);
      print(getCampusStudiesNumRes.message);
      return getCampusStudiesNumRes.data ?? 0;
    }
  } catch (e) {
    print(e);
  }
  return 0;
}

Future<Campus?> getCampusInfoWithCampusID(String campusID) async {
  var url = getCampusWithCampusIDBaseAddr + "/$campusID";
  GetCampusInfoRes getCampusInfoRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getCampusInfoRes = GetCampusInfoRes.fromJson(res);
      print(getCampusInfoRes.message);
      return getCampusInfoRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<List<CampusWithUser>?> getUserCampusWithNum(String userID) async {
  var url = getUserCampusWithNumBaseAddr + "/$userID";
  GetUserCampusWithNumRes getUserCampusWithNumRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getUserCampusWithNumRes = GetUserCampusWithNumRes.fromJson(res);
      print(getUserCampusWithNumRes.message);
      print("get campus num: ${getUserCampusWithNumRes.data!.length}");
      return getUserCampusWithNumRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> updateCampusNotice(String cid, String notice) async {
  var url = updateCampusNoticeAddr;
  var body = {"cid": cid, "notice": notice};
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
