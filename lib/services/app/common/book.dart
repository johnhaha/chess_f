import 'package:template/services/app/common/api.dart';
import 'package:template/services/app/common/req.dart';
import 'package:template/utility/fastHttp.dart';

class BookService {
  static Future<bool> updateBookTime(UpdateBookTimeReq req) async {
    var url = updateBookTimeAddr;
    var body = req.toJson();
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

  static Future<bool> updateBookplace(String bid, String placeID) async {
    var url = updateBookPlaceAddr;
    var body = {"bid": bid, "placeID": placeID};
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
}
