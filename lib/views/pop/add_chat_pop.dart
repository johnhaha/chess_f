import 'package:chess/data/contact_pop_data.dart';
import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/views/component/contact_card.dart';
import 'package:chess/views/pop/user_pop.dart';
import 'package:flutter/material.dart';
import 'package:hey/components/account/code_input.dart';
import 'package:magic/magic.dart';

class AddChatPop extends StatefulWidget {
  const AddChatPop({Key? key, required this.me}) : super(key: key);
  final GrapUser me;

  @override
  _AddChatPopState createState() => _AddChatPopState();
}

class _AddChatPopState extends State<AddChatPop> {
  late ContactPopData contactPopData;
  late TextEditingController _codeInputController;

  Future _getContactData() async {
    try {
      await contactPopData.getUserContactUser();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      MagicAlert.showTextToast("获取信息失败");
      _getContactData();
    }
  }

  Future _getUserWithCode(String code) async {
    MagicLoading.showLoading(context);
    try {
      var user = await contactPopData.getUserWithCode(code.toUpperCase());
      MagicLoading.hideLoading(context);
      // go user chat page
      await _showUserPop(user.userID);
    } catch (e) {
      MagicLoading.hideLoading(context);
      MagicAlert.showTextToast("查找失败");
    }
  }

  Future _showUserPop(String targetUserID) async {
    MagicModal.show(context,
        child: UserPop(userID: targetUserID, isChating: false, me: widget.me)
            .size(height: MagicModal.getHeight(MagicArea.small, context)));
  }

  // Future _goChat(String targetUserID) async {
  //   var targetID = KuUUID.mergeID(widget.userID, targetUserID);
  //   context.push(ChatPage(
  //       targetID: targetID,
  //       targetType: "user",
  //       userID: widget.userID,
  //       targetUserID: targetUserID));
  // }

  @override
  void initState() {
    super.initState();
    contactPopData = ContactPopData();
    _codeInputController = TextEditingController();
    // _codeInputController.addListener(() {
    //   _codeInputController.toUpperCase();
    //   setState(() {});
    // });
    _getContactData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "输入朋友聊天码",
          style: magicTheme.textPack.des2,
        ),
        MagicMargin(magicArea: MagicArea.normal).vertical(),
        CodeInput(
          onSubmit: _getUserWithCode,
          fieldsCount: 4,
          autoFocus: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        MagicMargin(magicArea: MagicArea.normal).vertical(),
        MagicList(
                element: (context, index) {
                  return ContactCard(
                          contactInfo: contactPopData.registeredContact[index])
                      .gesture(
                    ontap: () async {
                      await _showUserPop(
                          contactPopData.registeredContact[index].userID!);
                    },
                  ).withPadding(
                          top: magicSize.x2,
                          left: magicSize.x2,
                          right: magicSize.x2);
                },
                count: contactPopData.registeredContact.length)
            .list()
            .size(height: MagicSize.HAtom(context) * 50)
      ],
    ).padding(vertical: magicSize.x2).hideKeyboard(context);
  }
}
