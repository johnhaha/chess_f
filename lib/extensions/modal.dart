import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

extension modalControll on BuildContext {
  void showModal(Widget child) {
    showModalBottomSheet(
        backgroundColor: PageColor,
        context: this,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: child,
          );
        });
  }
}
