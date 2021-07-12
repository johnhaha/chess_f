import 'package:template/constants/colors.dart';
import 'package:flutter/material.dart';

class LandLoading extends StatelessWidget {
  LandLoading(
      {required this.child, required this.loadStatus, required this.loadMore});
  final Widget child;
  final LoadStatus loadStatus;
  final bool loadMore;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (loadStatus == LoadStatus.Loading)
          Center(
              child: CircularProgressIndicator(
            color: MainColor,
          )),
        if (loadStatus == LoadStatus.OK) child,
        if (loadStatus == LoadStatus.Failed) Center(child: Text("加载失败")),
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

enum LoadStatus { Loading, OK, Failed }
