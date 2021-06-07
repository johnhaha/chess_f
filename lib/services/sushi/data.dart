import 'package:template/services/water/data.dart';

class Message {
  Message(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.mid,
      required this.userId,
      required this.fromUserId,
      required this.title,
      required this.des,
      required this.msgCode,
      required this.itemId,
      required this.itemType,
      required this.app,
      required this.status,
      required this.executable});

//msgCode decide what the msg can do and show
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String mid;
  String userId;
  String fromUserId;
  String title;
  String des;
  String msgCode;
  String itemId;
  String itemType;
  String app;
  int status;
  bool executable;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      id: json["ID"],
      createdAt: DateTime.parse(json["CreatedAt"]),
      updatedAt: DateTime.parse(json["UpdatedAt"]),
      mid: json["mid"],
      userId: json["userID"],
      fromUserId: json["fromUserID"],
      title: json["title"],
      des: json["des"],
      msgCode: json["msgCode"],
      itemId: json["itemID"],
      itemType: json["itemType"],
      app: json["app"],
      status: json["status"],
      executable: json["executable"]);
}

class GetUserMsgsRes {
  GetUserMsgsRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<MsgWithUser>? data;
  String message;
  bool success;

  factory GetUserMsgsRes.fromJson(Map<String, dynamic> json) => GetUserMsgsRes(
        data: List<MsgWithUser>.from(
            json["data"].map((x) => MsgWithUser.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

enum PushChanel { ios, android }
enum PushSupplier { apple, jpush }

String getPushChanelStr(PushChanel chanel) {
  switch (chanel) {
    case PushChanel.ios:
      return "ios";
    case PushChanel.android:
      return "android";
  }
}

String getPushSupplierStr(PushSupplier supplier) {
  switch (supplier) {
    case PushSupplier.apple:
      return "apple";
    case PushSupplier.jpush:
      return "jpush";
  }
}

class MsgWithUser {
  MsgWithUser({
    required this.message,
    required this.user,
  });

  Message message;
  UserInfo user;

  factory MsgWithUser.fromJson(Map<String, dynamic> json) => MsgWithUser(
        message: Message.fromJson(json["message"]),
        user: UserInfo.fromJson(json["user"]),
      );
}
