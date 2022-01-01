import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/views/component/chat_avatar.dart';
import 'package:flutter/material.dart';
import 'package:hole/init.dart';
import 'package:magic/magic.dart';

///pop user card
class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.grapUser}) : super(key: key);
  final GrapUser grapUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ChatAvatar(
          avatar: holeMediaAssets.getUrl(grapUser.avatar),
          name: grapUser.name,
          online: grapUser.online,
        ),
        Text(
          grapUser.name,
          style: magicTheme.textPack.text2,
        )
            .onEmpty(Text(
              "未设置昵称",
              style: magicTheme.textPack.des2,
            ))
            .withPadding(top: magicSize.x1),
        if (grapUser.des != "")
          Text(
            grapUser.des,
            style: magicTheme.textPack.des2,
          ).withPadding(top: magicSize.x1),
      ],
    ).card(crossAlign: CrossAxisAlignment.center);
  }
}
