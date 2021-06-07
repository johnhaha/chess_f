import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/services/water/data.dart';

final userData = ChangeNotifierProvider((ref) => UserData());

class UserData extends ChangeNotifier {
  bool _login = false;
  User? _user;
  String _token = '';
  bool get login => _login;
  User? get user => _user;
  String get token => _token;

  void userLogin() {
    _login = true;
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
