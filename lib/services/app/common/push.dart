import 'package:template/data/common/message.dart';
import 'package:template/services/app/common/api.dart';
import 'package:template/utility/fastHttp.dart';

class PushService {
  static Future addPushDevice(String userID, String token, PushChanel chanel,
      PushSupplier supplier) async {
    var url = addPushDeviceAddr;
    MsgRes msgRes;
    var body = {
      "userID": userID,
      "deviceID": token,
      "chanel": getPushChanelStr(chanel),
      "supplier": getPushSupplierStr(supplier)
    };
    try {
      var res = await fastPost(url, body);
      if (res != null) {
        msgRes = MsgRes.fromJson(res);
        print(msgRes.message);
      }
    } catch (e) {
      print(e);
    }
  }
}
