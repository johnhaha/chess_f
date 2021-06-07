import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/services/sugar/api.dart';
import 'package:template/services/sugar/getImageInfo.dart';
import 'package:template/services/water/data.dart';
import 'package:template/views/components/editUser/editUser.dart';
import 'package:template/views/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/navigator.dart';
import 'userInfoData.dart';

class SmallAvatarWithName extends StatefulWidget {
  const SmallAvatarWithName(
      {Key? key, required this.userID, this.showName = true})
      : super(key: key);
  final String userID;
  final bool showName;

  @override
  _SmallAvatarWithNameState createState() => _SmallAvatarWithNameState();
}

class _SmallAvatarWithNameState extends State<SmallAvatarWithName> {
  late UserInfoData userInfoData;

  Future<bool> _getUserData() async {
    var res = await userInfoData.getUserInfo();
    setState(() {});
    return res;
  }

  @override
  void initState() {
    super.initState();
    userInfoData = UserInfoData(userID: widget.userID);
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        // if (userInfoData.getInfoOK)
        UserAvatar(userInfoData: userInfoData, radius: AvatarRadius3),
        H10(),
        if (userInfoData.getInfoOK && widget.showName)
          Text(
            userInfoData.userInfo!.nickName,
            style: theme.textTheme.bodyText1,
          )
      ],
    );
  }
}

class BigAvatarWithNameAndDes extends StatefulWidget {
  const BigAvatarWithNameAndDes(
      {Key? key, required this.userID, this.showDis = true})
      : super(key: key);
  final String userID;
  final bool showDis;
  @override
  _BigAvatarWithNameAndDesState createState() =>
      _BigAvatarWithNameAndDesState();
}

class _BigAvatarWithNameAndDesState extends State<BigAvatarWithNameAndDes> {
  late UserInfoData userInfoData;

  Future<bool> _getUserData() async {
    var res = await userInfoData.getUserInfo();
    if (res && mounted) {
      setState(() {});
    }

    return res;
  }

  @override
  void initState() {
    super.initState();
    userInfoData = UserInfoData(userID: widget.userID);
    _getUserData();
  }

  @override
  void didUpdateWidget(covariant BigAvatarWithNameAndDes oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // if (userInfoData.getInfoOK)
        UserAvatar(
          userInfoData: userInfoData,
          radius: AvatarRadius2,
        ),
        V10(),
        Text(
          userInfoData.getInfoOK ? userInfoData.userInfo!.nickName : "",
          style: theme.textTheme.bodyText1,
        ),
        if (userInfoData.getInfoOK && widget.showDis)
          Text(userInfoData.userInfo!.des),
      ],
    );
  }
}

class BigAvatarWithNameAndDesHeader extends StatefulWidget {
  const BigAvatarWithNameAndDesHeader(
      {Key? key, required this.userID, this.executes, required this.isMe})
      : super(key: key);
  final String userID;
  final List<Widget>? executes;
  final bool isMe;

  @override
  _BigAvatarWithNameAndDesHeaderState createState() =>
      _BigAvatarWithNameAndDesHeaderState();
}

class _BigAvatarWithNameAndDesHeaderState
    extends State<BigAvatarWithNameAndDesHeader> {
  late UserInfoData userInfoData;
  var avatarKey = UniqueKey();
  void _updateUserInfo(UserInfo userInfo) {
    userInfoData.userInfo = userInfo;
    // avatarKey = UniqueKey();
    setState(() {});
  }

  void _goEditUser() {
    print("object");
    if (userInfoData.userInfo != null && widget.isMe) {
      context.popUp(EditUser(
          userInfo: userInfoData.userInfo!, updateUserInfo: _updateUserInfo));
    }
  }

  Future<bool> _getUserData() async {
    var res = await userInfoData.getUserInfo();
    if (mounted) {
      setState(() {});
    }
    return res;
  }

  @override
  void initState() {
    super.initState();
    userInfoData = UserInfoData(userID: widget.userID);
    _getUserData();
  }

  @override
  void didUpdateWidget(covariant BigAvatarWithNameAndDesHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _goEditUser,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            V60(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // if (userInfoData.getInfoOK)
                    UserAvatar(
                      // key: avatarKey,
                      userInfoData: userInfoData,
                      radius: AvatarRadius1,
                    ),
                    H10(),
                    Text(
                      userInfoData.getInfoOK
                          ? userInfoData.userInfo!.nickName
                          : "",
                      style: theme.textTheme.headline3,
                    ),
                  ],
                ),
                Row(
                  children: widget.executes ?? [],
                )
              ],
            ),
            V10(),
            if (userInfoData.getInfoOK) Text(userInfoData.userInfo!.des),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatefulWidget {
  const UserAvatar({
    Key? key,
    required this.userInfoData,
    required this.radius,
  }) : super(key: key);

  final UserInfoData userInfoData;
  final double radius;

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  String? avatar;
  Future _getAvatar() async {
    if (widget.userInfoData.getInfoOK) {
      var imageInfo =
          await getImageInfoWithFileID(widget.userInfoData.userInfo!.avatar);
      if (imageInfo != null && mounted) {
        avatar = imageInfo.url;
        setState(() {});
        // print(avatar);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getAvatar();
  }

  @override
  void didUpdateWidget(covariant UserAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getAvatar();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage:
          avatar != null ? Image.network("$sugarHost/${avatar!}").image : null,
      radius: widget.radius,
      backgroundColor: CardWhiteColor,
    );
  }
}
