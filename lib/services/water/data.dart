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

// class UserInfo {
//   UserInfo({
//     required this.userId,
//     required this.avatar,
//     required this.nickName,
//     required this.des,
//   });

//   String userId;
//   String avatar;
//   String nickName;
//   String des;

//   factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
//         userId: json["userID"],
//         avatar: json["avatar"],
//         nickName: json["nickName"],
//         des: json["des"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userID": userId,
//         "avatar": avatar,
//         "nickName": nickName,
//         "des": des,
//       };
// }

class TelLoginRes {
  TelLoginRes({
    this.data,
    required this.message,
    required this.success,
  });

  String? data;
  String message;
  bool success;

  factory TelLoginRes.fromJson(Map<String, dynamic> json) => TelLoginRes(
        data: json["data"],
        message: json["message"],
        success: json["success"],
      );
}

class CheckLoginCodeRes {
  CheckLoginCodeRes({
    this.data,
    required this.message,
    this.newUser,
    required this.success,
    this.token,
  });

  User? data;
  String message;
  bool? newUser;
  bool success;
  String? token;

  factory CheckLoginCodeRes.fromJson(Map<String, dynamic> json) =>
      CheckLoginCodeRes(
        data: User.fromJson(json["data"]),
        message: json["message"],
        newUser: json["new"],
        success: json["success"],
        token: json["token"],
      );
}

class GetManyUsersRes {
  GetManyUsersRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<User>? data;
  String message;
  bool success;

  factory GetManyUsersRes.fromJson(Map<String, dynamic> json) =>
      GetManyUsersRes(
        data: json["data"] == null
            ? []
            : List<User>.from(json["data"].map((x) => User.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

class UserInfo {
  UserInfo({
    required this.userID,
    required this.app,
    required this.tel,
    required this.status,
    required this.avatar,
    required this.nickName,
    required this.des,
  });

  String userID;
  String app;
  String tel;
  int status;
  String avatar;
  String nickName;
  String des;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        userID: json["uid"],
        app: json["app"],
        tel: json["tel"],
        status: json["status"],
        avatar: json["avatar"],
        nickName: json["nickName"],
        des: json["des"],
      );
}
