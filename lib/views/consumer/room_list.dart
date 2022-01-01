import 'package:chess/data/app_data.dart';
import 'package:chess/views/component/room_card.dart';
import 'package:chess/views/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey/hey.dart';
import 'package:magic/components/bases/no_content.dart';
import 'package:moon/generated/red.pbgrpc.dart';
import 'package:moon/moon.dart';
import 'package:magic/magic.dart';

class ChatList extends ConsumerWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var userRoom = ref.watch(chatData).roomInfo;
    return MagicList(
            emptyView: NoContent(
              text: "还没有聊天",
              addPadding: magicSize.x4,
            ),
            element: (context, index) {
              return RoomCard(
                      key: Key(userRoom[index].room.roomID),
                      roomInfo: userRoom[index])
                  .gesture(
                ontap: () {
                  context.push(ChatPage(
                      me: ref.read(appData).me!,
                      targetUserID: _getAnotherUserID(userRoom[index].room,
                          ref.read(userData).user!.userID)));
                },
              ).withPadding(
                      top: magicSize.x2,
                      left: magicSize.x2,
                      right: magicSize.x2);
            },
            count: userRoom.length)
        .list();
  }

  String _getAnotherUserID(Room room, String otherThan) {
    if (room.members[0].userID == otherThan) {
      return room.members[1].userID;
    }
    return room.members[0].userID;
  }
}
