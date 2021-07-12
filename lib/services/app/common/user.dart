import 'package:template/constants/info.dart';
import 'package:template/services/app/common/api.dart';
import 'package:template/utility/fastHttp.dart';

class UserService {
  static Future<bool> updateUserInfo(
      String userID, String name, String des, String avatar) async {
    var url = updateUserInfoBaseAddr + userID;
    var body = {
      "name": name,
      "des": des,
      "avatar": avatar,
      "app": AppName,
    };
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
}
