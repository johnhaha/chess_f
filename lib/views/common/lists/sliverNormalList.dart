import 'package:flutter/material.dart';

class SliverNormalList extends StatelessWidget {
  const SliverNormalList(
      {Key? key,
      required this.listCount,
      required this.sliver,
      required this.des})
      : super(key: key);
  final int listCount;
  final Widget sliver;
  final String des;
  @override
  Widget build(BuildContext context) {
    if (listCount > 0) {
      return sliver;
    } else {
      return SliverToBoxAdapter(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(child: Text(des)),
          ),
        ],
      ));
    }
  }
}
