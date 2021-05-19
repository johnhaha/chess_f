class User {
  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.uid,
    required this.app,
    required this.tel,
    required this.wechatId,
    required this.wechatUnionId,
    required this.appleId,
    required this.status,
    required this.avatar,
    required this.nickName,
    required this.des,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String uid;
  String app;
  String tel;
  String wechatId;
  String wechatUnionId;
  String appleId;
  int status;
  String avatar;
  String nickName;
  String des;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        uid: json["uid"],
        app: json["app"],
        tel: json["tel"],
        wechatId: json["wechatID"],
        wechatUnionId: json["wechatUnionID"],
        appleId: json["appleID"],
        status: json["status"],
        avatar: json["avatar"],
        nickName: json["nickName"],
        des: json["des"],
      );
}

class UserInfo {
  UserInfo({
    required this.userId,
    required this.avatar,
    required this.nickName,
    required this.des,
  });

  String userId;
  String avatar;
  String nickName;
  String des;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userId: json["userID"],
        avatar: json["avatar"],
        nickName: json["nickName"],
        des: json["des"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "avatar": avatar,
        "nickName": nickName,
        "des": des,
      };
}
