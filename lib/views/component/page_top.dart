import 'package:flutter/material.dart';
import 'package:magic/magic.dart';

import '../../main.dart';

class PageTop extends StatelessWidget {
  const PageTop({
    Key? key,
    this.center,
    this.right,
    this.left,
  }) : super(key: key);
  final Widget? center;
  final Widget? right;
  final Widget? left;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: topBarHeight,
        width: context.getSize().width,
        color: magicTheme.pageColor,
        child: Row(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [left ?? const SizedBox()],
            )),
            center ?? const SizedBox(),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [right ?? const SizedBox()])),
          ],
        ).padding(
          horizontal: magicSize.x2,
        ));
  }
}
