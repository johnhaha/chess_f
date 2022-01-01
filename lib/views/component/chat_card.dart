import 'package:chess/views/component/msg_block.dart';
import 'package:flutter/material.dart';
import 'package:hole/init.dart';
import 'package:magic/components/card/pic.dart';
import 'package:magic/components/layout/responsive.dart';
import 'package:magic/magic.dart';
import 'package:moon/generated/red.pbgrpc.dart';

class ChatCard extends StatelessWidget {
  const ChatCard(
      {Key? key,
      required this.msg,
      required this.member,
      this.textEditingController,
      this.canInput = false,
      this.focusNode})
      : super(key: key);
  final Msg? msg;
  final Member? member;
  final TextEditingController? textEditingController;
  final bool canInput;
  final FocusNode? focusNode;

  bool get _showCard => member != null && member!.mediaUrl != "";

  @override
  Widget build(BuildContext context) {
    return FocusResponsiveBuilder(builder: (context, data) {
      return PicCard(
        width: magicSize.screenWidthWithPadding(context),
        height: data
            ? magicSize.screenWidthWithPadding(context) * 0.5
            : magicSize.screenWidthWithPadding(context) * 0.75,
        radius: magicSize.x2,
        child: MsgBlock(
          focusNode: focusNode,
          msg: msg,
          maxline: 8,
          showCard: _showCard,
          textEditingController: textEditingController,
          canInput: canInput,
        ).padding(horizontal: magicSize.x2, vertical: magicSize.x2),
        imageUrl: holeMediaAssets.getUrl(member?.mediaUrl ?? ""),
        foreColor: _showCard ? null : magicTheme.cardColor,
      );
    });
  }
}
