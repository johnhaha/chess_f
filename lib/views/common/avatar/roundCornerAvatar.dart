import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/hosts.dart';
import 'package:template/constants/size.dart';
import 'package:template/views/common/avatar/roundAvatar.dart';

class RoundCornerAvatar extends StatelessWidget {
  const RoundCornerAvatar({
    Key? key,
    required this.size,
    required this.url,
  }) : super(key: key);

  final AvatarSize size;
  final String url;

  @override
  Widget build(BuildContext context) {
    var _radius = getRoundCornerAvatarRadius(size);
    var _size = getRoundCornerAvatarSize(size);
    if (url != "") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Image.network(
          "$imageHost/$url",
          width: _size,
          height: _size,
          fit: BoxFit.cover,
        ),
      );
    }
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
          color: CardWhiteColor, borderRadius: BorderRadius.circular(_radius)),
    );
  }
}

double getRoundCornerAvatarRadius(AvatarSize size) {
  switch (size) {
    case AvatarSize.Big:
      return AvatarRadius1;
    case AvatarSize.Middle:
      return AvatarRadius2;
    case AvatarSize.Small:
      return AvatarRadius3;
  }
}

double getRoundCornerAvatarSize(AvatarSize size) {
  switch (size) {
    case AvatarSize.Big:
      return AvatarSize1;
    case AvatarSize.Middle:
      return AvatarSize2;
    case AvatarSize.Small:
      return AvatarSize3;
  }
}
