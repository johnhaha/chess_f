import 'package:template/constants/styles/colors.dart';
import 'package:template/constants/styles/size.dart';
import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  const CardBox({
    Key? key,
    required this.children,
  }) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: CardWhiteColor,
          borderRadius: BorderRadius.circular(BorderRadiusSize2)),
      width: size.width - 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingSize1, vertical: PaddingSize1),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
