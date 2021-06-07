import 'package:template/services/candy/comment.dart';
import 'package:template/services/candy/data.dart';

class CommentPublisherData {
  CommentPublisherData(
      {required this.userID, required this.targetId, required this.targetType});
  String userID;
  String targetId;
  String targetType;

  Future<Comment?> publishComment(String des) async {
    var res = await addComment(userID, "user", des, targetId, targetType);
    return res;
  }
}
