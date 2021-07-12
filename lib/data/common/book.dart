class Book {
  Book({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.bid,
    required this.targetId,
    required this.targetType,
    required this.app,
    required this.userId,
    required this.toUserId,
    required this.time,
    required this.dayStamp,
    required this.placeId,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String bid;
  String targetId;
  String targetType;
  String app;
  String userId;
  String toUserId;
  List<int> time;
  int dayStamp;
  String placeId;
  int status;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        bid: json["bid"],
        targetId: json["targetID"],
        targetType: json["targetType"],
        app: json["app"],
        userId: json["userID"],
        toUserId: json["toUserID"],
        time: json["time"] == null
            ? []
            : List<int>.from(json["time"].map((x) => x)),
        dayStamp: json["dayStamp"],
        placeId: json["placeID"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "bid": bid,
        "targetID": targetId,
        "targetType": targetType,
        "app": app,
        "userID": userId,
        "toUserID": toUserId,
        "time": time,
        "dayStamp": dayStamp,
        "placeID": placeId,
        "status": status,
      };
}
