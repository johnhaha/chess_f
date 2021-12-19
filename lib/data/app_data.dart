import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appData = ChangeNotifierProvider((ref) => AppData());

class AppData extends ChangeNotifier {
  Future getUserAppData(String userID) async {}
  void clearAppData() {}
}
