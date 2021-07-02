import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/user.dart';

final userData = ChangeNotifierProvider((ref) => UserData());

class UserData extends ChangeNotifier {
  bool _login = false;
  User? _user;
  String _token = '';
  String _deviceID = "";
  bool _cameraAuth = false;
  bool _geoAuth = false;
  bool get login => _login;
  User? get user => _user;
  String get token => _token;
  String get deviceID => _deviceID;
  bool get cameraAuth => _cameraAuth;
  bool get geoAuth => _geoAuth;

  void userLogin() {
    _login = true;
    notifyListeners();
  }

  void updateCameraAuth(bool auth) {
    _cameraAuth = auth;
    notifyListeners();
  }

  void setDeviceID(String id) {
    _deviceID = id;
    notifyListeners();
  }

  void updateGeoAuth(bool auth) {
    _geoAuth = auth;
    notifyListeners();
  }

  void userLogOut() {
    _login = false;
    notifyListeners();
  }

  void removeToken() {
    _token = '';
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void setToken(String theToken) {
    _token = theToken;
    notifyListeners();
  }

  void setUser(User theUser) {
    _user = theUser;
    notifyListeners();
  }

  void updateUserInfo(UserInfo userInfo) {
    _user!.avatar = userInfo.avatar;
    _user!.nickName = userInfo.nickName;
    _user!.des = userInfo.des;
    notifyListeners();
  }

  Future tokenLogin(String token) async {}
  Future userLogout(String token, String userID, String deviceID) async {}
  static Future addPushDevice() async {}
}

class CheckLoginRes {
  CheckLoginRes({
    this.data,
    required this.message,
    required this.success,
    this.token,
  });

  User? data;
  String message;
  bool success;
  String? token;

  factory CheckLoginRes.fromJson(Map<String, dynamic> json) => CheckLoginRes(
        data: User.fromJson(json['data']),
        message: json['message'],
        success: json['success'],
        token: json['token'],
      );
}
