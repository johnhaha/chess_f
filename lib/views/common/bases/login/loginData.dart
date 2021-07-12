import 'package:template/services/app/common/login.dart';
import 'package:template/services/app/common/res.dart';

class LoginData {
  int loginStep = 1;
  Future<bool> userTelLogin(String tel) async {
    var res = LoginService.telLogin(tel);
    return res;
  }

  Future<LoginRes?> checkTelCode(String tel, String code) async {
    var res = await LoginService.checkCode(tel, code);
    return res;
  }
}
