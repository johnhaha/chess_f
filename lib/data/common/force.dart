class Force {
  Force({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.fid,
    required this.books,
    required this.laborId,
    required this.dayStamp,
    required this.userId,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String fid;
  List<int> books;
  int laborId;
  int dayStamp;
  String userId;

  factory Force.fromJson(Map<String, dynamic> json) => Force(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        fid: json["fid"],
        books: json["books"] == null
            ? []
            : List<int>.from(json["books"].map((x) => x)),
        laborId: json["laborID"],
        dayStamp: json["dayStamp"],
        userId: json["userID"],
      );
}
