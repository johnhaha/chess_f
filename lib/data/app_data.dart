import 'dart:async';

import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/grap/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey/model/user.dart';
import 'package:hey/notify/user.dart';

final appData = ChangeNotifierProvider((ref) => AppData());

class AppData extends ChangeNotifier {
  ChatCode? _code;
  GrapUser? _me;
  var service = GrapService();

  UserNotify? _userNotify;

  Timer? _codeTimer;

  ChatCode? get code => _code;
  GrapUser? get me => _me;

  set setCode(ChatCode? c) {
    _code = c;
    notifyListeners();
  }

  set setMe(GrapUser? u) {
    _me = u;
    notifyListeners();
  }

  void updateMeFromUserInfo(UserInfo u) {
    _me?.avatar = u.avatar;
    _me?.name = u.nickName;
    _me?.des = u.des;
    notifyListeners();
  }

  Future getUserAppData(String userID) async {
    await getUserAndCode(userID);
    _codeTimer = Timer.periodic(const Duration(minutes: 5), (t) async {
      await getUserCode(userID);
    });
    _userNotify = UserNotify(userID: userID);
    _userNotify!.repeatUserOnline();
  }

  void clearAppData() {
    _userNotify?.cancelUserOnlineNotify();
    _codeTimer?.cancel();
    setCode = null;
    setMe = null;
  }

  Future getUserAndCode(String userID) async {
    try {
      var res = await service.getUserAndCode(userID);
      setCode = res.code;
      setMe = res.user;
    } catch (e) {
      rethrow;
    }
  }

  Future getUserCode(String userID) async {
    try {
      var res = await service.getUserCode(userID);
      setCode = res;
    } catch (e) {
      rethrow;
    }
  }
}
