import 'package:chess/grap/generated/grap.pb.dart';
import 'package:flutter/material.dart';
import 'package:magic/components/tools/count_down.dart';
import 'package:magic/magic.dart';

class ChatCodeCard extends StatelessWidget {
  const ChatCodeCard({Key? key, required this.chatCode}) : super(key: key);
  final ChatCode chatCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(chatCode.code, style: magicTheme.textPack.boldText3),
        Text("朋友可输入聊天码向你发起聊天", style: magicTheme.textPack.text2)
            .withPadding(top: magicSize.x1),
        CountDownTimer(
                dt: DateTime.parse(chatCode.expireAt),
                style: magicTheme.textPack.des2)
            .withPadding(top: magicSize.x1)
      ],
    ).card(crossAlign: CrossAxisAlignment.center);
  }
}
