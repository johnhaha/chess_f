import 'package:template/data/common/labor.dart';
import 'package:template/data/common/place.dart';
import 'package:template/data/common/post.dart';
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

class LoginRes {
  LoginRes({
    this.data,
    required this.message,
    required this.success,
  });

  LoginData? data;
  String message;
  bool success;

  factory LoginRes.fromJson(Map<String, dynamic> json) => LoginRes(
        data: LoginData.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class LoginData {
  LoginData({
    required this.isNew,
    required this.token,
    required this.user,
  });

  bool isNew;
  String token;
  UserInfo user;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        isNew: json["isNew"],
        token: json["token"],
        user: UserInfo.fromJson(json["user"]),
      );
}

class AddPostRes {
  AddPostRes({
    this.data,
    required this.message,
    required this.success,
  });

  Post? data;
  String message;
  bool success;

  factory AddPostRes.fromJson(Map<String, dynamic> json) => AddPostRes(
        data: Post.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class GetTxPlacesRes {
  GetTxPlacesRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<List<TXPlace>>? data;
  String message;
  bool success;

  factory GetTxPlacesRes.fromJson(Map<String, dynamic> json) => GetTxPlacesRes(
        data: List<List<TXPlace>>.from(json["data"]
            .map((x) => List<TXPlace>.from(x.map((x) => TXPlace.fromJson(x))))),
        message: json["message"],
        success: json["success"],
      );
}

class GetUserLaborForceRes {
  GetUserLaborForceRes({
    this.data,
    required this.message,
    required this.success,
  });

  LaborForce? data;
  String message;
  bool success;

  factory GetUserLaborForceRes.fromJson(Map<String, dynamic> json) =>
      GetUserLaborForceRes(
        data: LaborForce.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class AddPlaceRes {
  AddPlaceRes({
    required this.message,
    required this.success,
    this.data,
  });

  String message;
  bool success;
  Place? data;

  factory AddPlaceRes.fromJson(Map<String, dynamic> json) => AddPlaceRes(
        message: json["message"],
        success: json["success"],
        data: Place.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data?.toJson(),
      };
}

class GetUserLaborPlaceRes {
  GetUserLaborPlaceRes({
    this.data,
    required this.message,
    required this.success,
  });

  LaborPlace? data;
  String message;
  bool success;

  factory GetUserLaborPlaceRes.fromJson(Map<String, dynamic> json) =>
      GetUserLaborPlaceRes(
        data: LaborPlace.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
