import 'dart:async';

import 'package:chess/data/app_data.dart';
import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/grap/service.dart';
import 'package:chess/views/component/chat_avatar.dart';
import 'package:chess/views/component/chat_card.dart';
import 'package:chess/views/component/page_top.dart';
import 'package:chess/views/pop/user_pop.dart';
import 'package:flutter/material.dart';
import 'package:hey/notify/user.dart';
import 'package:hole/init.dart';
import 'package:ku/utils/debouncer.dart';
import 'package:moon/data/chat_page_data.dart';
import 'package:moon/data/define.dart';
import 'package:moon/generated/red.pbgrpc.dart';
import 'package:pump/push.dart';
import 'package:pump/shared.dart';
import 'package:magic/magic.dart';
import 'package:ku/ku.dart';
import 'package:hey/hey.dart';

import '../../main.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {Key? key,
      // required this.targetID,
      // required this.targetType,
      required this.me,
      required this.targetUserID})
      : super(key: key);
  // final String targetID;
  // final String targetType;
  final GrapUser me;
  final String targetUserID;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatPageData _chatPageData;
  GrapUser? _targetUser;
  var _service = GrapService();
  var debouncer = Debouncer(duration: const Duration(milliseconds: 500));
  var notifyDebouncer = Debouncer(duration: const Duration(milliseconds: 5000));
  late TextEditingController _textEditingController;
  var focusNode = FocusNode();
  var _sentText = "";

  final _targetOnlineStreamController = StreamController<bool>();
  Stream<bool> get _targetOnlineStream => _targetOnlineStreamController.stream;

  // final _meMsgStreamController = StreamController<Msg?>();
  // Stream<Msg?> get _meMsgStream => _meMsgStreamController.stream;
  // void _addMeNewMsg(Msg? m) {
  //   _meMsgStreamController.sink.add(m);
  // }

  final _targetMsgStreamController = StreamController<Msg?>();
  Stream<Msg?> get _targetMsgStream => _targetMsgStreamController.stream;
  void _addTargetNewMsg(Msg? m) {
    _targetMsgStreamController.sink.add(m);
  }

  Member? _targetMember;

  Future _initRoom() async {
    try {
      _targetUser = await _service.getUserInfo(widget.targetUserID);
      var res = await _chatPageData
          .initRoom(userIDs: [widget.me.userID, widget.targetUserID]);
      if (res) {
        await _chatPageData.getMemberLatestMsg();
        _targetMember = await _chatPageData.getTargetMember(
            targetUserID: widget.targetUserID);
        _sentText = _chatPageData
                .latestMsgOf(_chatPageData.member!.memberID)
                ?.content ??
            "";
        _textEditingController.text = _sentText;
        if (mounted) {
          setState(() {});
        }

        _addTargetNewMsg(_chatPageData.latestMsgOf(_targetMember!.memberID));
        _chatPageData.subMsg(onNewMsg: (msg) {
          if (msg.memberID == _targetMember!.memberID) {
            _addTargetNewMsg(msg);
          }
        });
        _listenToUserInput();
        _subTargetOnline();
      }
    } catch (e) {
      MagicAlert.showTextToast("加载失败");
    }
  }

  void _listenToUserInput() {
    _textEditingController.addListener(() {
      debouncer.run(() async {
        // print("on going");
        if (_textEditingController.text != _sentText) {
          await _chatPageData.sendMsg(_textEditingController.text);
          _sentText = _textEditingController.text;
          _chatPageData.setNotifyLevel = PushNotifyLevel.aPlus;
        }
      });
      notifyDebouncer.run(() {
        _chatPageData.setNotifyLevel = PushNotifyLevel.none;
      });
    });
  }

  Future _subTargetOnline() async {
    await UserNotify.subUserStatus(widget.me.userID, [widget.targetUserID],
        (x) {
      if (x.status == "" || x.status == "online") {
        _targetOnlineStreamController.sink.add(true);
      }
      if (x.status == "offline") {
        _targetOnlineStreamController.sink.add(false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _chatPageData = ChatPageData(
        app: sharedAppName,
        userID: widget.me.userID,
        nickName: widget.me.name,
        avatar: widget.me.avatar,
        chatRoomType: ChatRoomType.userRoom);
    _textEditingController = TextEditingController();
    focusNode.observe();
    _initRoom();
  }

  @override
  void dispose() {
    _chatPageData.dispose();
    debouncer.cancel();
    notifyDebouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: magicTheme.pageColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                StreamBuilder<Msg?>(
                    stream: _targetMsgStream,
                    builder: (context, snapshot) {
                      return ChatCard(msg: snapshot.data, member: _targetMember)
                          .withPadding(
                              top: magicSize.x2,
                              left: magicSize.x2,
                              right: magicSize.x2);
                    }),
                ChatCard(
                        textEditingController: _textEditingController,
                        focusNode: focusNode,
                        canInput: true,
                        msg: null,
                        member: _chatPageData.member)
                    .withPadding(
                        top: magicSize.x2,
                        left: magicSize.x2,
                        right: magicSize.x2),
              ],
            ).withPadding(top: topBarHeight),
          ),
          PageTop(
            left: MagicButton.icon(
                icon: Icons.chevron_left,
                style: MagicStyle.bland,
                onClick: () {
                  Navigator.pop(context);
                }),
            center: _targetUser == null
                ? null
                : StreamBuilder<bool>(
                    stream: _targetOnlineStream,
                    builder: (context, snapshot) {
                      return ChatAvatar(
                        avatar: holeMediaAssets.getUrl(_targetUser!.avatar),
                        name: _targetUser!.name,
                        online: snapshot.data ?? _targetUser!.online,
                      ).gesture(
                        ontap: () {
                          MagicModal.show(context,
                              child: UserPop(
                                userID: _targetUser!.userID,
                                isChating: true,
                                me: context.read(appData).me!,
                              ).size(
                                  height: MagicModal.getHeight(
                                          MagicArea.mini, context)
                                      .min(240)));
                        },
                      );
                    }),
          ),
        ],
      ).safeArea(top: true, bottom: true).hideKeyboard(context),
    );
  }
}
