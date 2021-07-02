import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/common/layout/spacer.dart';

class NoAvatarHeader extends StatelessWidget {
  const NoAvatarHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: CardWhiteColor, borderRadius: BorderRadius.circular(24)),
        ),
        H10(),
        Text(
          "未设置",
          style: bodyText1,
        )
      ],
    );
  }
}
