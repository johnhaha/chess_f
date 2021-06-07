import 'package:template/services/candy/data.dart';
import 'package:template/services/water/data.dart';

class Campus {
  Campus({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.cid,
    required this.userId,
    required this.notice,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String cid;
  String userId;
  String notice;
  int status;

  factory Campus.fromJson(Map<String, dynamic> json) => Campus(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        cid: json["cid"],
        userId: json["userID"],
        notice: json["notice"],
        status: json["status"],
      );
}

class GetUserDetailDataRes {
  GetUserDetailDataRes({
    this.data,
    required this.message,
    required this.success,
  });

  CampusUserDetailData? data;
  String message;
  bool success;

  factory GetUserDetailDataRes.fromJson(Map<String, dynamic> json) =>
      GetUserDetailDataRes(
        data: CampusUserDetailData.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class CampusUserDetailData {
  CampusUserDetailData({
    required this.campus,
    required this.comments,
    required this.studyNum,
    required this.user,
  });

  Campus campus;
  List<CommentWithUser> comments;
  int studyNum;
  UserInfo user;

  factory CampusUserDetailData.fromJson(Map<String, dynamic> json) =>
      CampusUserDetailData(
        campus: Campus.fromJson(json["campus"]),
        comments: json["comments"] == null
            ? []
            : List<CommentWithUser>.from(
                json["comments"].map((x) => CommentWithUser.fromJson(x))),
        studyNum: json["studyNum"],
        user: UserInfo.fromJson(json["user"]),
      );
}

class CampusWithUser {
  CampusWithUser({
    required this.campus,
    required this.user,
  });

  CampusWithStudyNum campus;
  UserInfo user;

  factory CampusWithUser.fromJson(Map<String, dynamic> json) => CampusWithUser(
        campus: CampusWithStudyNum.fromJson(json["campus"]),
        user: UserInfo.fromJson(json["user"]),
      );
}

class CampusWithStudyNum {
  CampusWithStudyNum({
    required this.campus,
    required this.studyNum,
  });

  Campus campus;
  int studyNum;

  factory CampusWithStudyNum.fromJson(Map<String, dynamic> json) =>
      CampusWithStudyNum(
        campus: Campus.fromJson(json["campus"]),
        studyNum: json["studyNum"],
      );
}

class Study {
  Study({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.sid,
    required this.userId,
    required this.campus,
    required this.campusId,
    required this.applyId,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String sid;
  String userId;
  Campus campus;
  int campusId;
  String applyId;
  int status;

  factory Study.fromJson(Map<String, dynamic> json) => Study(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        sid: json["sid"],
        userId: json["userID"],
        campus: Campus.fromJson(json["campus"]),
        campusId: json["campusID"],
        applyId: json["applyID"],
        status: json["status"],
      );
}

class AddStudyRes {
  AddStudyRes({
    this.data,
    required this.message,
    required this.success,
  });

  Study? data;
  String message;
  bool success;

  factory AddStudyRes.fromJson(Map<String, dynamic> json) => AddStudyRes(
        data: Study.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class CheckUserStudyStatusRes {
  CheckUserStudyStatusRes({
    this.data,
    required this.message,
    required this.success,
  });

  int? data;
  String message;
  bool success;

  factory CheckUserStudyStatusRes.fromJson(Map<String, dynamic> json) =>
      CheckUserStudyStatusRes(
        data: json["data"],
        message: json["message"],
        success: json["success"],
      );
}

class GetUserStudiesRes {
  GetUserStudiesRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<Study>? data;
  String message;
  bool success;

  factory GetUserStudiesRes.fromJson(Map<String, dynamic> json) =>
      GetUserStudiesRes(
        data: List<Study>.from(json["data"].map((x) => Study.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

class GetUserCampusWithNumRes {
  GetUserCampusWithNumRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<CampusWithUser>? data;
  String message;
  bool success;

  factory GetUserCampusWithNumRes.fromJson(Map<String, dynamic> json) =>
      GetUserCampusWithNumRes(
        data: json["data"] == null
            ? []
            : List<CampusWithUser>.from(
                json["data"].map((x) => CampusWithUser.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

class GetUserCampusRes {
  GetUserCampusRes({
    this.data,
    required this.message,
    required this.success,
  });

  Campus? data;
  String message;
  bool success;

  factory GetUserCampusRes.fromJson(Map<String, dynamic> json) =>
      GetUserCampusRes(
        data: Campus.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class GetCampusStudiesNumRes {
  GetCampusStudiesNumRes({
    this.data,
    required this.message,
    required this.success,
  });

  int? data;
  String message;
  bool success;

  factory GetCampusStudiesNumRes.fromJson(Map<String, dynamic> json) =>
      GetCampusStudiesNumRes(
        data: json["data"],
        message: json["message"],
        success: json["success"],
      );
}

class GetCampusInfoRes {
  GetCampusInfoRes({
    this.data,
    required this.message,
    required this.success,
  });

  Campus? data;
  String message;
  bool success;

  factory GetCampusInfoRes.fromJson(Map<String, dynamic> json) =>
      GetCampusInfoRes(
        data: Campus.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class GetStudyInfoRes {
  GetStudyInfoRes({
    this.data,
    required this.message,
    required this.success,
  });

  Study? data;
  String message;
  bool success;

  factory GetStudyInfoRes.fromJson(Map<String, dynamic> json) =>
      GetStudyInfoRes(
        data: Study.fromJson(json["data"]),
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
