import 'package:chess/views/component/chat_avatar.dart';
import 'package:chess/views/component/msg_block.dart';
import 'package:flutter/material.dart';
import 'package:hole/init.dart';
import 'package:magic/components/card/pic.dart';
import 'package:moon/generated/red.pbgrpc.dart';
import 'package:magic/magic.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key, required this.roomInfo}) : super(key: key);
  final RoomInfo roomInfo;

  Member get _chatTarget => roomInfo.room.members
      .firstWhere((element) => element.memberID != roomInfo.member.memberID);
  Msg? get _latestMsg {
    if (roomInfo.room.msgs.isNotEmpty) {
      return roomInfo.room.msgs.first;
    }
    return null;
  }

  bool get _withBg =>
      _chatTarget.mediaType == "pic" && _chatTarget.mediaUrl != "";

  @override
  Widget build(BuildContext context) {
    return PicCard(
      alignment: Alignment.centerLeft,
      width: magicSize.screenWidthWithPadding(context),
      height: magicSize.x4,
      radius: magicSize.x1,
      imageUrl: holeMediaAssets.getUrl(_chatTarget.mediaUrl),
      foreColor: _withBg ? null : magicTheme.cardColor,
      child: Row(
        children: [
          ChatAvatar(
            avatar: holeMediaAssets.getUrl(_chatTarget.avatar),
            showBorder: _withBg,
            name: _chatTarget.nickName,
          ),
          MagicMargin(magicArea: MagicArea.small).horizontal(),
          Expanded(
            child: MsgBlock(
              msg: _latestMsg,
              showCard: _withBg,
            ),
          )
        ],
      ).padding(horizontal: magicSize.x2, vertical: magicSize.x1),
    );
  }
}
