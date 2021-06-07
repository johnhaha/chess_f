import 'package:template/services/water/api.dart';

import 'package:template/services/fastHttp.dart';
import 'package:template/services/water/data.dart';

class UserInfoData {
  UserInfoData({required this.userID});
  String userID;
  UserInfo? userInfo;
  bool getInfoOK = false;
  Future<bool> getUserInfo() async {
    var addr = getUserInfoBaseAddr + "/$userID";
    GetUserInfoRes getUserInfoRes;
    try {
      var res = await fastGet(addr);
      if (res != null) {
        getUserInfoRes = GetUserInfoRes.fromJson(res);
        print(getUserInfoRes.message);
        if (getUserInfoRes.success) {
          userInfo = getUserInfoRes.data!;
          getInfoOK = true;
          return true;
        }
      }
    } catch (e) {
      print(e);
    }
    getInfoOK = false;
    return false;
  }
}

class GetUserInfoRes {
  GetUserInfoRes({
    this.data,
    required this.message,
    required this.success,
  });

  UserInfo? data;
  String message;
  bool success;

  factory GetUserInfoRes.fromJson(Map<String, dynamic> json) => GetUserInfoRes(
        data: UserInfo.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
