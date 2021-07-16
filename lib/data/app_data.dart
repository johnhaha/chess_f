import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appData = ChangeNotifierProvider((ref) => AppData());

class AppData extends ChangeNotifier {
  bool _canCamera = false;
  bool _msgBadget = false;
  ConnectivityResult _connection = ConnectivityResult.none;

  bool get canCamera => _canCamera;
  bool get msgBadget => _msgBadget;
  ConnectivityResult get connection => _connection;
  bool get connectionStatus => _connection != ConnectivityResult.none;

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

  void updateConnection(ConnectivityResult connect) {
    _connection = connect;
    notifyListeners();
  }

  Future getUserAppData(String userID) async {}
  void clearAppData() {}
}
