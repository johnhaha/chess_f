class Comment {
  Comment({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
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
  dynamic deletedAt;
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
        deletedAt: json["DeletedAt"],
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
