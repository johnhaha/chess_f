class PlaceHandler {
  static String? getProvinceID(String placeID) {
    if (placeID.length == 6) {
      var subcode = placeID.substring(0, 2);
      return subcode + "0000";
    }
  }

  static bool checkIsProvince(String placeID) {
    if (placeID.length == 6) {
      var subcode = placeID.substring(2);
      return subcode == "0000";
    }
    throw "bad code";
  }
}
