import 'package:template/constants/info.dart';
import 'package:template/services/app/common/api.dart';
import 'package:template/utility/fastHttp.dart';

class LikeService {
  static Future<bool> likeAct(String userID, String postID, bool act) async {
    var url = likeActAddr;
    var body = {
      "fromID": userID,
      "toID": postID,
      "toType": "post",
      "app": AppName,
      "isLike": act,
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
