import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/data/common/user.dart';
import 'package:template/data/userData.dart';

extension UserInfos on BuildContext {
  bool getUserLogin() {
    var login = read(userData).login;
    return login;
  }

  String? getUserID() {
    var login = this.getUserLogin();
    if (login) {
      var user = read(userData).user;
      if (user != null) {
        return user.uid;
      }
    }
  }

  UserInfo? getUserInfo() {
    var user = read(userData).user;
    if (user != null) {
      return user.userInfo;
    }
  }

  String getToken() {
    var token = read(userData).token;
    return token;
  }
}
