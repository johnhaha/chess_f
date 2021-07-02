import 'package:template/data/common/content.dart';

class Post {
  Post({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.pid,
    required this.contentType,
    required this.contentId,
    required this.des,
    required this.posterId,
    required this.posterType,
    required this.targetId,
    required this.targetType,
    required this.app,
    required this.status,
    required this.content,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String pid;
  PostType contentType;
  int contentId;
  String des;
  String posterId;
  String posterType;
  String targetId;
  String targetType;
  String app;
  int status;
  Content content;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        pid: json["pid"],
        contentType: getPostType(json["contentType"]),
        contentId: json["contentID"],
        des: json["des"],
        posterId: json["posterID"],
        posterType: json["posterType"],
        targetId: json["targetID"],
        targetType: json["targetType"],
        app: json["app"],
        status: json["status"],
        content: Content.fromJson(json["content"]),
      );
}

enum PostType { text, pic, unknown }

String getPostTypeStr(PostType postType) {
  switch (postType) {
    case PostType.text:
      return "text";
    case PostType.pic:
      return "pic";
    case PostType.unknown:
      return "unknown";
  }
}

PostType getPostType(String postTypeStr) {
  switch (postTypeStr) {
    case "text":
      return PostType.text;
    case "pic":
      return PostType.pic;
    default:
      return PostType.unknown;
  }
}
