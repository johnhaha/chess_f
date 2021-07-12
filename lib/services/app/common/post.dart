import 'package:template/constants/info.dart';
import 'package:template/data/common/post.dart';
import 'package:template/services/app/common/res.dart';
import 'package:template/utility/fastHttp.dart';

import 'api.dart';

class PostService {
  static Future<Post?> addPost(
      PostType contentType,
      String contentID,
      String des,
      String posterID,
      String posterType,
      String targetID,
      String targetType) async {
    var url = addPostAddr;
    var body = {
      "contentType": getPostTypeStr(contentType),
      "contentID": contentID,
      "des": des,
      "posterID": posterID,
      "posterType": posterType,
      "targetID": targetID,
      "targetType": targetType,
      "app": AppName
    };
    AddPostRes addPostRes;
    try {
      var res = await fastPost(url, body);
      if (res != null) {
        addPostRes = AddPostRes.fromJson(res);
        print(addPostRes.message);
        return addPostRes.data;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> deletePost(String postID) async {
    var url = delPostBaseAddr + postID;
    MsgRes msgRes;
    try {
      var res = await fastGet(url);
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
