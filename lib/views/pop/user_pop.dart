import 'package:chess/data/user_pop_data.dart';
import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/views/component/user_card.dart';
import 'package:chess/views/consumer/me_chat_code_card.dart';
import 'package:chess/views/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:hey/components/editUser/edit_user_model.dart';
import 'package:hey/model/user.dart';
import 'package:ku/utils/uuid.dart';
import 'package:magic/components/buttons/big_button.dart';
import 'package:magic/magic.dart';
import 'package:hey/hey.dart';

class UserPop extends StatefulWidget {
  const UserPop(
      {Key? key,
      required this.userID,
      required this.isChating,
      required this.me,
      this.onUpdateInfo})
      : super(key: key);
  final String userID;
  final GrapUser? me;
  final bool isChating;
  final Function(UserInfo)? onUpdateInfo;

  bool get isMe => userID == me?.userID;

  @override
  State<UserPop> createState() => _UserPopState();
}

class _UserPopState extends State<UserPop> {
  late UserPopData userPopData;

  Future _getUserData() async {
    try {
      await userPopData.getUserData();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      MagicAlert.showTextToast("加载失败");
    }
  }

  Future _goChat() async {
    var targetID = KuUUID.mergeID(widget.userID, widget.userID);
    context.push(ChatPage(
        // targetID: targetID,
        // targetType: "user",
        me: widget.me!,
        targetUserID: widget.userID));
  }

  @override
  void initState() {
    super.initState();
    userPopData = UserPopData(userID: widget.userID);
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: magicTheme.pageColor,
      child: Column(
        children: [
          userPopData.user == null
              ? const SizedBox()
              : UserCard(grapUser: userPopData.user!).gesture(
                  ontap: () {
                    if (widget.isMe) {
                      var userInfo = context.read(userData).user;
                      showEditUserModal(
                          context: context,
                          userInfo: userInfo!,
                          onSuccess: (x) {
                            // Navigator.pop(context);
                            userPopData.updateFromUserInfo(x);
                            setState(() {});
                            if (widget.onUpdateInfo != null) {
                              widget.onUpdateInfo!(x);
                            }
                          });
                    }
                  },
                ),
          if (!widget.isChating && widget.isMe)
            const MeChatCode().withPadding(top: magicSize.x2),
          if (!widget.isChating && !widget.isMe)
            BigButton(txt: "聊天", onPress: _goChat)
                .withPadding(top: magicSize.x2)
        ],
      ).padding(vertical: magicSize.x2),
    );
  }
}
