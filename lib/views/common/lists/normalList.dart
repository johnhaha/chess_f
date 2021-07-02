import 'package:flutter/material.dart';

class NormalList extends StatelessWidget {
  const NormalList(
      {Key? key,
      required this.listCount,
      required this.child,
      required this.des})
      : super(key: key);
  final int listCount;
  final Widget child;
  final String des;
  @override
  Widget build(BuildContext context) {
    if (listCount > 0) {
      return child;
    } else {
      return Center(child: Text(des));
    }
  }
}
