import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/hosts.dart';
import 'package:template/constants/size.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.avatarSize,
    required this.url,
  }) : super(key: key);
  final AvatarSize avatarSize;
  final String url;

  @override
  Widget build(BuildContext context) {
    var radius = getUserAvatarSize(avatarSize);
    if (url != "") {
      return CircleAvatar(
        radius: radius,
        foregroundImage: Image.network("$imageHost/$url").image,
      );
    } else {
      return Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
            color: CardWhiteColor, borderRadius: BorderRadius.circular(radius)),
      );
    }
  }
}

enum AvatarSize { Big, Middle, Small }

double getUserAvatarSize(AvatarSize size) {
  switch (size) {
    case AvatarSize.Big:
      return AvatarRadius1;
    case AvatarSize.Middle:
      return AvatarRadius2;
    case AvatarSize.Small:
      return AvatarRadius3;
  }
}
