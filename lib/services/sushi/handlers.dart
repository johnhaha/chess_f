import 'package:template/constants/configs.dart';
import 'package:template/services/sushi/api.dart';

import 'package:template/services/fastHttp.dart';

import 'data.dart';

Future<List<MsgWithUser>?> getUserMsgs(String userID) async {
  var url = getUserMsgAddr;
  var body = {"userID": userID, "app": AppName};
  GetUserMsgsRes getUserMsgsRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getUserMsgsRes = GetUserMsgsRes.fromJson(res);
      return getUserMsgsRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> addPushDevice(String userID, String deviceID, PushChanel chanel,
    PushSupplier supplier) async {
  var url = addPushDeviceAddr;
  var body = {
    "userID": userID,
    "app": AppName,
    "deviceID": deviceID,
    "chanel": getPushChanelStr(chanel),
    "supplier": getPushSupplierStr(supplier)
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
