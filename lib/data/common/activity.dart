import 'package:template/constants/info.dart';

class Activity {
  Activity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.targetId,
    required this.targetType,
    required this.app,
    required this.likeNum,
    required this.blockNum,
    required this.followNum,
    required this.commentNum,
    required this.rateNum,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String targetId;
  String targetType;
  String app;
  int likeNum;
  int blockNum;
  int followNum;
  int commentNum;
  int rateNum;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        targetId: json["targetID"],
        targetType: json["targetType"],
        app: json["app"],
        likeNum: json["likeNum"],
        blockNum: json["blockNum"],
        followNum: json["followNum"],
        commentNum: json["commentNum"],
        rateNum: json["rateNum"],
      );

  static Activity getSampleActivity(String targetId, String targetType) =>
      Activity(
          id: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          targetId: targetId,
          targetType: targetType,
          app: AppName,
          likeNum: 0,
          blockNum: 0,
          followNum: 0,
          commentNum: 0,
          rateNum: 0);
}
