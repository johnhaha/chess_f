import 'package:flutter/material.dart';
import 'package:magic/components/card/color.dart';
import 'package:magic/magic.dart';
import 'package:moon/generated/red.pbgrpc.dart';

class MsgBlock extends StatelessWidget {
  const MsgBlock(
      {Key? key,
      required this.msg,
      this.showCard = true,
      this.maxline,
      this.canInput = false,
      this.focusNode,
      this.textEditingController})
      : super(key: key);
  final Msg? msg;
  final bool showCard;
  final int? maxline;
  final TextEditingController? textEditingController;
  final bool canInput;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ColorCard(
        child: canInput
            ? TextField(
                focusNode: focusNode,
                textAlignVertical: TextAlignVertical.center,
                maxLines: maxline,
                controller: textEditingController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "输入对话内容",
                    isCollapsed: true,
                    hintStyle: magicTheme.textPack.des2,
                    border: InputBorder.none,
                    counterText: ""),
              )
            : Text(
                msg?.content ?? "",
                maxLines: maxline ?? 1,
                overflow: maxline == null || maxline == 1
                    ? TextOverflow.ellipsis
                    : null,
              ),
        showCard: showCard,
        color: magicColor.whitePack.color2,
        radius: magicSize.x1,
        hPadding: magicSize.x1,
        vPadding: magicSize.x1 / 2);
  }
}
