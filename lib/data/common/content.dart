class Content {
  Content({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.cid,
    required this.contentType,
    required this.contentUrls,
    required this.width,
    required this.height,
    required this.size,
    required this.number,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String cid;
  String contentType;
  List<String> contentUrls;
  int width;
  int height;
  int size;
  int number;
  int status;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        cid: json["cid"],
        contentType: json["contentType"],
        contentUrls: json["contentUrls"] == null
            ? []
            : List<String>.from(json["contentUrls"].map((x) => x)),
        width: json["width"],
        height: json["height"],
        size: json["size"],
        number: json["number"],
        status: json["status"],
      );
}

class AddContentRes {
  AddContentRes({
    this.data,
    required this.message,
    required this.success,
  });

  Content? data;
  String message;
  bool success;

  factory AddContentRes.fromJson(Map<String, dynamic> json) => AddContentRes(
        data: Content.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
