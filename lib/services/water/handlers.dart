import 'package:template/constants/configs.dart';
import 'package:template/services/water/api.dart';
import 'package:template/data/userData.dart';
import 'package:template/services/fastHttp.dart';

import 'data.dart';

Future<CheckLoginRes?> tokenLogin(String token) async {
  var addr = tokenLoginAddr;
  CheckLoginRes checkLoginRes;
  var body = {"th": token};
  try {
    var res = await fastPost(addr, body, auth: true, token: token);
    if (res != null) {
      checkLoginRes = CheckLoginRes.fromJson(res);
      return checkLoginRes;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> signOut(String token) async {
  var url = userSignoutAddr;
  MsgRes msgRes;
  try {
    var res = await fastGet(url, auth: true, token: token);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<bool> telLogin(String tel) async {
  var body = {
    "tel": tel,
    "app": AppName,
  };
  TelLoginRes telLoginRes;
  try {
    var res = await fastPost(userLoginAddr, body);
    if (res != null) {
      telLoginRes = TelLoginRes.fromJson(res);
      print(telLoginRes.message + (telLoginRes.data ?? "没有嘛？"));
      return telLoginRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<CheckLoginCodeRes?> checkCode(String tel, String code) async {
  var body = {
    "tel": tel,
    "code": code,
    "app": AppName,
  };
  CheckLoginCodeRes checkLoginCodeRes;
  try {
    var res = await fastPost(loginCheckCodeAddr, body);
    if (res != null) {
      checkLoginCodeRes = CheckLoginCodeRes.fromJson(res);
      return checkLoginCodeRes;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> updateUserInfo(
    String avatar, String des, String name, String userId) async {
  var url = updateUserInfoBaseAddr + "/$userId";
  var body = {"name": name, "des": des, "avatar": avatar, "app": AppName};
  MsgRes msgRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}

Future<List<User>?> getManyUsers(List<String> userIDs) async {
  var url = getManyUsersAddr;
  var body = {"userIDs": userIDs, "app": AppName};
  GetManyUsersRes getManyUsersRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getManyUsersRes = GetManyUsersRes.fromJson(res);
      print(getManyUsersRes.message);
      return getManyUsersRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<List<User>?> searchUsers(String keyword, String app) async {
  var url = searchUserAddr;
  var body = {"keyword": keyword, "app": app};
  GetManyUsersRes getManyUsersRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getManyUsersRes = GetManyUsersRes.fromJson(res);
      print(getManyUsersRes.message);
      return getManyUsersRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<List<User>?> getOrderedUsers(String app) async {
  var url = getOrderedUserBaseAddr + "/$app";
  GetManyUsersRes getManyUsersRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getManyUsersRes = GetManyUsersRes.fromJson(res);
      print(getManyUsersRes.message);
      return getManyUsersRes.data;
    }
  } catch (e) {
    print(e);
  }
}
