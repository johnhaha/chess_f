import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';

class IconWithDes extends StatelessWidget {
  const IconWithDes({
    Key? key,
    required this.icon,
    required this.des,
  }) : super(key: key);
  final IconData icon;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: DisColor,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 48,
          width: 100,
          child: Text(
            des,
            style: bodyText1,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
