import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

class LandLoading extends StatelessWidget {
  LandLoading({required this.child, required this.loadComplete});
  final Widget child;
  final bool loadComplete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (!loadComplete)
          Center(
              child: CircularProgressIndicator(
            color: MainColor,
          ))
      ],
    );
  }
}
