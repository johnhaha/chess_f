import 'package:flutter/material.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/common/avatar/roundAvatar.dart';

class SmallAvatarWithName extends StatelessWidget {
  const SmallAvatarWithName({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(avatarSize: AvatarSize.Small, url: imageUrl),
        SizedBox(
          width: 8,
        ),
        Text(
          name,
          style: bodyText1,
        )
      ],
    );
  }
}
