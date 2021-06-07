import 'package:template/services/water/data.dart';

class Comment {
  Comment({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.cid,
    required this.authorId,
    required this.authorType,
    required this.content,
    required this.status,
    required this.targetId,
    required this.targetType,
    required this.app,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String cid;
  String authorId;
  String authorType;
  String content;
  int status;
  String targetId;
  String targetType;
  String app;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        cid: json["cid"],
        authorId: json["authorID"],
        authorType: json["authorType"],
        content: json["content"],
        status: json["status"],
        targetId: json["targetID"],
        targetType: json["targetType"],
        app: json["app"],
      );
}

//req and res

class AddCommentRes {
  AddCommentRes({
    this.data,
    required this.message,
    required this.success,
  });

  Comment? data;
  String message;
  bool success;

  factory AddCommentRes.fromJson(Map<String, dynamic> json) => AddCommentRes(
        data: Comment.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class GetCommentsRes {
  GetCommentsRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<Comment>? data;
  String message;
  bool success;

  factory GetCommentsRes.fromJson(Map<String, dynamic> json) => GetCommentsRes(
        data: List<Comment>.from(json["data"].map((x) => Comment.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

class GetManyTargetCommentNumRes {
  GetManyTargetCommentNumRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<int>? data;
  String message;
  bool success;

  factory GetManyTargetCommentNumRes.fromJson(Map<String, dynamic> json) =>
      GetManyTargetCommentNumRes(
        data: List<int>.from(json["data"].map((x) => x)),
        message: json["message"],
        success: json["success"],
      );
}

class CommentWithUser {
  CommentWithUser({
    required this.comment,
    required this.user,
  });

  Comment comment;
  UserInfo user;

  factory CommentWithUser.fromJson(Map<String, dynamic> json) =>
      CommentWithUser(
        comment: Comment.fromJson(json["comment"]),
        user: UserInfo.fromJson(json["user"]),
      );
}
