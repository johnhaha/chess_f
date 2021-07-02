import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/common/layout/spacer.dart';

class RoundCornerAvatarWithName extends StatelessWidget {
  const RoundCornerAvatarWithName({
    Key? key,
    required this.iamgeUrl,
    required this.name,
    required this.noAvatar,
  }) : super(key: key);
  final String iamgeUrl;
  final String name;
  final bool noAvatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        noAvatar
            ? Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: PageColor,
                    border: Border.all(color: CardWhiteColor, width: 2),
                    borderRadius:
                        BorderRadius.all(Radius.circular(BorderRadiusSize2))),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(BorderRadiusSize2),
                child: Image.network(
                  iamgeUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
        H10(),
        Text(
          name,
          style: bodyText1,
        )
      ],
    );
  }
}
