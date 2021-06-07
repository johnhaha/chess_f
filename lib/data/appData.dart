import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appData = ChangeNotifierProvider((ref) => AppData());

class AppData extends ChangeNotifier {
  String? _sample;

  void setCampus(String sample) {
    _sample = sample;
    notifyListeners();
  }

  Future getUserAppData(String userID) async {}
}
