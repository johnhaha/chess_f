import 'package:template/data/common/location.dart';

class Place {
  Place({
    required this.layer,
    required this.status,
    required this.id,
    required this.name,
    required this.fullName,
    required this.longName,
    required this.placeId,
    required this.belongto,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  int layer;
  int status;
  String id;
  String name;
  String fullName;
  String longName;
  String placeId;
  String belongto;
  Location location;
  int createdAt;
  int updatedAt;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        layer: json["layer"],
        status: json["status"],
        id: json["_id"],
        name: json["name"],
        fullName: json["fullName"],
        longName: json["longName"],
        placeId: json["placeID"],
        belongto: json["belongto"],
        location: Location.fromJson(json["location"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "layer": layer,
        "status": status,
        "_id": id,
        "name": name,
        "fullName": fullName,
        "longName": longName,
        "placeID": placeId,
        "belongto": belongto,
        "location": location.toJson(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class TXLocationPoint {
  TXLocationPoint({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory TXLocationPoint.fromJson(Map<String, dynamic> json) =>
      TXLocationPoint(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );
  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class TXPlace {
  TXPlace({
    required this.id,
    this.name,
    required this.fullname,
    required this.pinyin,
    required this.location,
    this.cidx,
  });

  String id;
  String? name;
  String fullname;
  List<String> pinyin;
  TXLocationPoint location;
  List<int>? cidx;

  factory TXPlace.fromJson(Map<String, dynamic> json) => TXPlace(
        id: json["id"],
        name: json["name"],
        fullname: json["fullname"],
        pinyin: json["pinyin"] == null
            ? []
            : List<String>.from(json["pinyin"].map((x) => x)),
        location: TXLocationPoint.fromJson(json["location"]),
        cidx: json["cidx"] == null
            ? null
            : List<int>.from(json["cidx"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullname": fullname,
        "pinyin": List<dynamic>.from(pinyin.map((x) => x)),
        "location": location.toJson(),
        "cidx": cidx == null ? null : List<dynamic>.from(cidx!.map((x) => x)),
      };
  int get layer {
    var subStr = id.substring(2);
    if (subStr == "0000") {
      return 3;
    }
    return 4;
  }

  String get belongto {
    var subStr = id.substring(2);
    if (subStr == "0000") {
      return 'china';
    }
    return id.substring(0, 2) + "0000";
  }

  Place toPlace() => Place(
      layer: layer,
      status: 1,
      id: id,
      name: name ?? "",
      fullName: fullname,
      longName: fullname,
      placeId: id,
      belongto: belongto,
      location: Location(
          coordinates: [location.lng, location.lat], id: id, type: 'point'),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch);
}
