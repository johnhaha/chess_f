import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

class LandLoading extends StatelessWidget {
  LandLoading(
      {required this.child,
      required this.loadComplete,
      required this.loadMore});
  final Widget child;
  final bool loadComplete;
  final bool loadMore;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        child,
        if (!loadComplete)
          Center(
              child: CircularProgressIndicator(
            color: MainColor,
          )),
        if (loadMore)
          Positioned(
              bottom: 20,
              child: CircularProgressIndicator(
                color: MainColor,
              ))
      ],
    );
  }
}
