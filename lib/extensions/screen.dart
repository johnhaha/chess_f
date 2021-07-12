import 'package:flutter/material.dart';

extension screen on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  Size getSize() {
    return MediaQuery.of(this).size;
  }

  bool checkKeyboard() {
    print(MediaQuery.of(this).viewInsets.bottom);
    return MediaQuery.of(this).viewInsets.bottom != 0;
  }
}
