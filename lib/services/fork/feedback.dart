import 'package:template/constants/info.dart';
import 'package:template/services/fork/api.dart';
import 'package:template/handlers/device.dart';
import 'package:template/utility/fastHttp.dart';

Future<bool> addFeedback(String userID, String content, bool login) async {
  var url = addFeedbackAddr;
  var device = await getDevideInfo();
  var body = {
    "userID": userID,
    "version": AppVersion.toStringAsFixed(2),
    "device": device.name,
    "os": device.os,
    "content": content,
    "platform": device.platform,
    "login": login,
    "app": AppName
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
