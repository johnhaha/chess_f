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
