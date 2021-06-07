import 'package:flutter/material.dart';

extension keyboardControll on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}
