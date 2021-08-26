import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appData = ChangeNotifierProvider((ref) => AppData());

class AppData extends ChangeNotifier {
  bool _canCamera = false;
  bool _msgBadget = false;

  bool get canCamera => _canCamera;
  bool get msgBadget => _msgBadget;

  void showMsgBadge() {
    _msgBadget = true;
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

  Future getUserAppData(String userID) async {}
  void clearAppData() {}
}
