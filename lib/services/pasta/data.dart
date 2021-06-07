class Item {
  Item({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.value,
    required this.des,
    required this.app,
    required this.createdAt,
    required this.updatedAt,
    required this.itemType,
    required this.tags,
    required this.title,
  });

  int id;
  String userId;
  String itemId;
  double value;
  String des;
  String app;
  DateTime createdAt;
  DateTime updatedAt;
  String itemType;
  List<String> tags;
  String title;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        value: json["value"] == null ? 0 : json["value"],
        des: json["des"] == null ? "" : json["des"],
        app: json["app"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        itemType: json["item_type"],
        tags: json["tags"] == null ? [] : json["tags"],
        title: json["title"] == null ? "" : json["title"],
      );

  factory Item.fromSearchHit(Map<String, dynamic> json) => Item(
      id: 0,
      userId: json["userID"],
      itemId: json["id"],
      value: 0,
      des: json["des"] == null ? "" : json["des"],
      app: json["app"],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      itemType: json["itemType"],
      tags: [],
      title: json["title"] == null ? "" : json["title"]);
}

class SearchRes {
  SearchRes({
    required this.message,
    required this.success,
    this.data,
  });

  String message;
  bool success;
  SearchResData? data;

  factory SearchRes.fromJson(Map<String, dynamic> json) => SearchRes(
        message: json["message"],
        success: json["success"],
        data: SearchResData.fromJson(json["data"]),
      );
}

class SearchResData {
  SearchResData({
    required this.hits,
    required this.offset,
    required this.limit,
    required this.nbHits,
    required this.exhaustiveNbHits,
    required this.processingTimeMs,
    required this.query,
  });

  List<Item> hits;
  int offset;
  int limit;
  int nbHits;
  bool exhaustiveNbHits;
  int processingTimeMs;
  String query;

  factory SearchResData.fromJson(Map<String, dynamic> json) => SearchResData(
        hits: List<Item>.from(json["hits"].map((x) => Item.fromSearchHit(x))),
        offset: json["offset"],
        limit: json["limit"],
        nbHits: json["nbHits"],
        exhaustiveNbHits: json["exhaustiveNbHits"],
        processingTimeMs: json["processingTimeMs"],
        query: json["query"],
      );
}
