import 'package:chess/data/app_data.dart';
import 'package:chess/views/component/page_top.dart';
import 'package:chess/views/consumer/me_avatar.dart';
import 'package:chess/views/consumer/room_list.dart';
import 'package:chess/views/pop/add_chat_pop.dart';
import 'package:flutter/material.dart';
import 'package:hey/components/my_drawer/me_drawer.dart';
import 'package:magic/magic.dart';
import 'package:hey/hey.dart';

import '../../main.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: magicTheme.pageColor,
        endDrawer: MeDrawer(
          width: MagicSize.WAtom(context) * 80,
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            const ChatList().withPadding(top: topBarHeight),
            PageTop(
              right: Icon(
                Icons.menu,
                color: magicColor.black,
                size: magicSize.x2,
              ).gesture(ontap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              }),
              center: const MeAvatar(),
            ),
            Positioned(
                bottom: magicSize.x3,
                right: magicSize.x2,
                child: MagicButton.floatIcon(
                    icon: Icons.add,
                    onClick: () {
                      var res = context.checkLogin();
                      if (!res) {
                        return;
                      }
                      MagicModal.show(context,
                          background: magicTheme.pageColor,
                          child: AddChatPop(
                            me: context.read(appData).me!,
                          ).size(
                              height: MagicModal.getHeight(
                                  MagicArea.big, context)));
                    }).safeArea(bottom: true))
          ],
        ).safeArea(top: true, bottom: true));
  }
}
