class Location {
  Location({
    required this.coordinates,
    required this.id,
    required this.type,
  });

  List<double> coordinates;
  String id;
  String type;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        id: json["_id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "_id": id,
        "type": type,
      };
}
