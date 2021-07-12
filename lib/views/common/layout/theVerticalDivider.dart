import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

class TheVerticalDivider extends StatelessWidget {
  const TheVerticalDivider({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: height,
      color: PageColor,
    );
  }
}
