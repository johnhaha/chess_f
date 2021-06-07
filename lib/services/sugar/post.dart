import 'package:template/constants/configs.dart';
import 'package:template/services/fastHttp.dart';
import 'package:template/services/sugar/data.dart';

import 'api.dart';

Future<Post?> addPost(
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

Future<List<Post>?> getTargetPost(String targetID, String targetType) async {
  var url = getTargetPostAddr;
  var body = {"targetID": targetID, "targetType": targetType, "app": AppName};
  GetTargetPostRes getTargetPostRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getTargetPostRes = GetTargetPostRes.fromJson(res);
      print(getTargetPostRes.message);
      return getTargetPostRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future deletePost(String pid) async {
  var url = deletePostBaseAddr + "/$pid";
  MsgRes msgRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      msgRes = MsgRes.fromJson(res);
      return msgRes.success;
    }
  } catch (e) {
    print(e);
  }
  return false;
}
