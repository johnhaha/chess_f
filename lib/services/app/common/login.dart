import 'package:template/constants/info.dart';
import 'package:template/services/app/common/api.dart';
import 'package:template/services/app/common/res.dart';
import 'package:template/utility/fastHttp.dart';

class LoginService {
  static Future<bool> telLogin(String tel) async {
    var url = userLoginAddr;
    var body = {"tel": tel, "app": AppName};
    TelLoginRes telLoginRes;
    try {
      var res = await fastPost(url, body);
      if (res != null) {
        telLoginRes = TelLoginRes.fromJson(res);
        print(telLoginRes.data);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<LoginRes?> checkCode(String tel, String code) async {
    var url = checkLoginCodeAddr;
    var body = {"tel": tel, "code": code, "app": AppName};
    LoginRes checkLoginCodeRes;
    try {
      var res = await fastPost(url, body);
      if (res != null) {
        checkLoginCodeRes = LoginRes.fromJson(res);
        return checkLoginCodeRes;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<LoginRes?> tokenLogin(String token) async {
    var addr = tokenLoginAddr;
    LoginRes loginRes;
    var body = {"th": token};
    try {
      var res = await fastPost(addr, body, auth: true, token: token);
      if (res != null) {
        loginRes = LoginRes.fromJson(res);
        return loginRes;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> userLogout(
      String userID, String deviceID, String token) async {
    var url = userLogoutAddr;
    MsgRes msgRes;
    var body = {"userID": userID, "token": deviceID, "app": AppName};
    try {
      var res = await fastPost(url, body, auth: true, token: token);
      if (res != null) {
        msgRes = MsgRes.fromJson(res);
        return msgRes.success;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
