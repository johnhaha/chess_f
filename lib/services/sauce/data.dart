class Apply {
  Apply({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.aid,
    required this.targetId,
    required this.targetType,
    required this.userId,
    required this.toUserId,
    required this.des,
    required this.app,
    required this.approved,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String aid;
  String targetId;
  String targetType;
  String userId;
  String toUserId;
  String des;
  String app;
  bool approved;
  int status;

  factory Apply.fromJson(Map<String, dynamic> json) => Apply(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        aid: json["aid"],
        targetId: json["targetID"],
        targetType: json["targetType"],
        userId: json["userID"],
        toUserId: json["toUserID"],
        des: json["des"],
        app: json["app"],
        approved: json["approved"],
        status: json["status"],
      );
}

class MakeApplyRes {
  MakeApplyRes({
    this.data,
    required this.message,
    required this.success,
  });

  Apply? data;
  String message;
  bool success;

  factory MakeApplyRes.fromJson(Map<String, dynamic> json) => MakeApplyRes(
        data: Apply.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class GetApplyRes {
  GetApplyRes({
    this.data,
    required this.message,
    required this.success,
  });

  Apply? data;
  String message;
  bool success;

  factory GetApplyRes.fromJson(Map<String, dynamic> json) => GetApplyRes(
        data: Apply.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
