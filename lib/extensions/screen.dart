import 'package:flutter/material.dart';

extension screen on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  Size getSize() {
    return MediaQuery.of(this).size;
  }
}
