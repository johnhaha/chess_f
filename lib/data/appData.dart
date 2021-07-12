import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/services/app/common/place.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/place.dart';

final appData = ChangeNotifierProvider((ref) => AppData());

class AppData extends ChangeNotifier {
  bool _canCamera = false;
  bool _msgBadget = false;
  ConnectivityResult _connection = ConnectivityResult.none;
  List<TXPlace> _provinceData = [];
  List<TXPlace> _cityData = [];

  bool get canCamera => _canCamera;
  bool get msgBadget => _msgBadget;
  ConnectivityResult get connection => _connection;
  bool get connectionStatus => _connection != ConnectivityResult.none;
  List<TXPlace> get provinceData => _provinceData;
  List<TXPlace> get cityData => _cityData;

  void showMsgBadge() {
    _msgBadget = true;
    notifyListeners();
  }

  set setProvince(List<TXPlace> places) {
    _provinceData = places;
    notifyListeners();
  }

  set setCity(List<TXPlace> places) {
    _cityData = places;
    notifyListeners();
  }

  void hideMsgBadge() {
    _msgBadget = false;
    notifyListeners();
  }

  void setCamera(bool can) {
    _canCamera = can;
    notifyListeners();
  }

  void updateConnection(ConnectivityResult connect) {
    _connection = connect;
    notifyListeners();
  }

  Future getUserAppData(String userID) async {}
  void clearAppData() {}

  Future getPlaces() async {
    var pres = await SharedPreferences.getInstance();
    var placeStr = pres.getString("places");
    List<List<TXPlace>> places = [];
    if (placeStr != null) {
      var rdsRes = json.decode(placeStr);
      places = List<List<TXPlace>>.from(rdsRes
          .map((x) => List<TXPlace>.from(x.map((x) => TXPlace.fromJson(x)))));
    } else {
      var placesRes = await PlaceService.getTXPlaces();
      if (placesRes != null) {
        print(placesRes.length);
        places = placesRes;
        var placesMap = List<dynamic>.from(
            places.map((x) => List<dynamic>.from(x.map((x) => x.toJson()))));
        pres.setString('places', jsonEncode(placesMap));
      }
    }
    if (places.length > 1) {
      print("get places ok 😄");
      setProvince = places[0];
      print("get ${_provinceData.length} provinces");
      setCity = places[1];
      print("get ${_cityData.length} cities");
    }
  }
}
