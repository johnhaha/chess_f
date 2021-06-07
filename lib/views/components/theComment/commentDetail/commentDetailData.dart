import 'package:template/services/candy/comment.dart';
import 'package:template/services/candy/data.dart';

class CommentDetailData {
  CommentDetailData({required this.targetId, required this.targetType});
  String targetId;
  String targetType;
  List<Comment> comments = [];
  Future<bool> getComments() async {
    var res = await getTargetComments(targetId, targetType);
    if (res != null) {
      comments = res;
      return true;
    }
    return false;
  }
}
