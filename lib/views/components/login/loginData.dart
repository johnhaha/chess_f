import 'package:template/services/water/data.dart';
import 'package:template/services/water/handlers.dart';

class LoginData {
  int loginStep = 1;
  Future<bool> userTelLogin(String tel) async {
    var res = telLogin(tel);
    return res;
  }

  Future<CheckLoginCodeRes?> checkTelCode(String tel, String code) async {
    var res = checkCode(tel, code);
    return res;
  }
}
