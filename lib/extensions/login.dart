import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/services/app/common/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/data/appData.dart';
import 'package:template/data/common/user.dart';
import 'package:template/data/userData.dart';

extension LoginProvider on BuildContext {
  Future login(UserInfo user, String token) async {
    read(userData).setUser(user);
    read(userData).userLogin();
    read(userData).setToken(token);
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    // await registerUserDevice(user.uid);
    // await read(appData).getUserAppData(user.uid);
  }

  Future logout() async {
    read(userData).removeToken();
    read(userData).removeUser();
    read(userData).userLogOut();
    read(appData).clearAppData();
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<bool> userTokenLogin() async {
    var login = read(userData).login;
    if (!login) {
      print("token login now");
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      print(token);
      if (token != null) {
        var res = await LoginService.tokenLogin(token);
        if (res != null && res.success) {
          print("token login userID is ${res.data!.user.tel}");
          await this.login(res.data!.user, res.data!.token);
          return true;
        }
      }
    }
    return false;
  }

  Future<bool> userSignOut() async {
    var login = read(userData).login;
    if (login) {
      print("you are loged in, let's log out");
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var userID = read(userData).user!.userID;
      var deviceID = read(userData).deviceID;
      if (token != null) {
        var res = await LoginService.userLogout(
          userID,
          deviceID,
          token,
        );
        if (res) {
          this.logout();
          return true;
        }
      }
    }
    return false;
  }
}
