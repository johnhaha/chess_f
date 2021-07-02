import 'package:template/data/common/user.dart';

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
