import 'package:template/constants/configs.dart';
import 'package:template/services/fastHttp.dart';
import 'package:template/services/fork/api.dart';

Future<bool> addReport(
    String userID, String targetID, String targetType, String des) async {
  var url = addReportAddr;
  var body = {
    "userID": userID,
    "targetID": targetID,
    "targetType": targetType,
    "des": des,
    "code": "text",
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
