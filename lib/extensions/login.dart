import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/data/appData.dart';
import 'package:template/data/userData.dart';
import 'package:template/services/sushi/data.dart';
import 'package:template/services/sushi/handlers.dart';
import 'package:template/services/water/data.dart';
import 'package:template/services/water/handlers.dart';
import 'package:template/utility/device.dart';

extension LoginProvider on BuildContext {
  Future login(User user, String token) async {
    read(userData).setUser(user);
    read(userData).userLogin();
    read(userData).setToken(token);
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    read(appData).getUserAppData(user.uid);
    var apn = await getApnDeviceID();
    if (apn != null) {
      await addPushDevice(user.uid, apn, PushChanel.ios, PushSupplier.apple);
    }
  }

  Future logout() async {
    read(userData).removeToken();
    read(userData).removeUser();
    read(userData).userLogOut();
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
        var res = await tokenLogin(token);
        if (res != null && res.success) {
          await this.login(res.data!, res.token!);
          return true;
        }
      }
    }
    return false;
  }

  Future<bool> userSignOut() async {
    var login = read(userData).login;
    if (login) {
      print("you are loged in");
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (token != null) {
        var res = await signOut(token);
        if (res) {
          this.logout();
          return true;
        }
      }
    }
    return false;
  }
}
