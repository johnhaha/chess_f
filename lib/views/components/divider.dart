import 'package:bean_client/constants/styles/colors.dart';
import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 40,
      height: 2,
      color: PageColor,
    );
  }
}
