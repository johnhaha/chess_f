import 'package:template/constants/configs.dart';
import 'package:template/services/candy/api.dart';
import 'package:template/services/candy/data.dart';
import 'package:template/services/fastHttp.dart';

Future<Comment?> addComment(
  String authorID,
  String authorType,
  String content,
  String targetID,
  String targetType,
) async {
  var url = addCommentAddr;
  var body = {
    "authorID": authorID,
    "authorType": authorType,
    "content": content,
    "targetID": targetID,
    "targetType": targetType,
    "app": AppName
  };
  AddCommentRes addCommentRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      addCommentRes = AddCommentRes.fromJson(res);
      print(addCommentRes.message);
      return addCommentRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<List<Comment>?> getTargetComments(
  String targetID,
  String targetType,
) async {
  var url = getTargetCommentAddr;
  var body = {"targetID": targetID, "targetType": targetType, "app": AppName};
  GetCommentsRes getCommentsRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getCommentsRes = GetCommentsRes.fromJson(res);
      print(getCommentsRes.message);
      return getCommentsRes.data;
    }
  } catch (e) {
    print(e);
  }
}

Future<bool> deleteComment(String cid) async {
  var url = deleteCommnetBaseAddr + "/$cid";
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

Future<List<int>?> getManyTargetCommentNum(
  List<String> targetIDs,
  String targetType,
) async {
  var url = getManyTargetsCommentNumAddr;
  var body = {"targetIDs": targetIDs, "targetType": targetType, "app": AppName};
  GetManyTargetCommentNumRes getManyTargetCommentNumRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getManyTargetCommentNumRes = GetManyTargetCommentNumRes.fromJson(res);
      print(getManyTargetCommentNumRes.message);
      return getManyTargetCommentNumRes.data;
    }
  } catch (e) {
    print(e);
  }
}
