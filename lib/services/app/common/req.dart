import 'package:template/constants/info.dart';

class UpdateBookTimeReq {
  UpdateBookTimeReq(
      {required this.time,
      required this.bid,
      required this.laborID,
      required this.dayStamp,
      required this.userID});
  List<int> time;
  String bid;
  String laborID;
  int dayStamp;
  String app = AppName;
  String userID;

  Map<String, dynamic> toJson() => {
        "time": time,
        "bid": bid,
        "laborID": laborID,
        "dayStamp": dayStamp,
        "app": app,
        "userID": userID
      };
}

class AddPlaceReq {
  AddPlaceReq(
      {required this.name,
      required this.fullName,
      required this.belongto,
      required this.lot,
      required this.lat,
      required this.longName});
  String name;
  String fullName;
  String belongto;
  double lot;
  double lat;
  String longName;

  Map<String, dynamic> toJson() => {
        "name": name,
        "fullName": fullName,
        "belongto": belongto,
        "lot": lot,
        "lat": lat,
        "longName": longName
      };
}
