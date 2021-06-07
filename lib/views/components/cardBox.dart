import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  const CardBox({
    Key? key,
    required this.children,
    this.mainAlign,
    this.crossAlign,
  }) : super(key: key);
  final List<Widget> children;
  final MainAxisAlignment? mainAlign;
  final CrossAxisAlignment? crossAlign;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: CardWhiteColor,
            borderRadius: BorderRadius.circular(BorderRadiusSize2)),
        width: size.width - 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingSize1, vertical: PaddingSize1),
          child: Column(
            mainAxisAlignment: mainAlign ?? MainAxisAlignment.center,
            crossAxisAlignment: crossAlign ?? CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}

class GridCardBox extends StatelessWidget {
  const GridCardBox({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: (size.width - 60) / 2,
      height: height,
      decoration: BoxDecoration(
          color: CardWhiteColor,
          borderRadius: BorderRadius.circular(BorderRadiusSize2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: child,
      ),
    );
  }
}
