import 'package:flutter/material.dart';
import 'package:template/constants/theme.dart';

class DesText extends StatelessWidget {
  const DesText({
    Key? key,
    required this.des,
  }) : super(key: key);
  final String des;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        des,
        style: bodyText1,
      ),
    );
  }
}
