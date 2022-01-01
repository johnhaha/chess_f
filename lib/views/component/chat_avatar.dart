import 'package:flutter/material.dart';
import 'package:magic/magic.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar(
      {Key? key,
      required this.avatar,
      required this.name,
      this.online = false,
      this.showBorder = false})
      : super(key: key);
  final String avatar;
  final bool online;
  final bool showBorder;
  final String name;

  @override
  Widget build(BuildContext context) {
    return MagicAvatar(avatar: avatar, magicArea: MagicArea.normal, name: name)
        .withBoder(color: magicTheme.cardColor, showBorder: showBorder)
        .withDot(
            style: MagicStyle.ok,
            show: online,
            alignment: Alignment.bottomRight);
  }
}
