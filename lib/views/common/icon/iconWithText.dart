import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/common/layout/spacer.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: DisColor,
        ),
        H8(),
        Text(
          text,
          style: bodyText1,
        )
      ],
    );
  }
}
