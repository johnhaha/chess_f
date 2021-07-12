import 'package:template/data/common/place.dart';

import 'force.dart';

class Labor {
  Labor({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.lid,
    required this.userId,
    required this.app,
    required this.placeId,
    required this.start,
    required this.end,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String lid;
  String userId;
  String app;
  String placeId;
  int start;
  int end;
  int status;

  factory Labor.fromJson(Map<String, dynamic> json) => Labor(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        lid: json["lid"],
        userId: json["userID"],
        app: json["app"],
        placeId: json["placeID"],
        start: json["start"],
        end: json["end"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "lid": lid,
        "userID": userId,
        "app": app,
        "placeID": placeId,
        "start": start,
        "end": end,
        "status": status,
      };
}

class LaborForce {
  LaborForce({
    required this.labor,
    required this.forces,
  });

  Labor labor;
  List<Force> forces;

  factory LaborForce.fromJson(Map<String, dynamic> json) => LaborForce(
        labor: Labor.fromJson(json["labor"]),
        forces: json["forces"] == null
            ? []
            : List<Force>.from(json["forces"].map((x) => Force.fromJson(x))),
      );
}

class LaborPlace {
  LaborPlace({
    required this.labor,
    required this.place,
  });

  Labor labor;
  Place place;

  factory LaborPlace.fromJson(Map<String, dynamic> json) => LaborPlace(
        labor: Labor.fromJson(json["labor"]),
        place: Place.fromJson(json["place"]),
      );
}
