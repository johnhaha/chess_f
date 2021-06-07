import 'package:template/constants/colors.dart';
import 'package:template/constants/size.dart';
import 'package:template/services/sugar/api.dart';
import 'package:template/services/water/data.dart';
import 'package:template/views/components/editUser/editUser.dart';
import 'package:template/views/components/theAvatar/userInfoData.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/navigator.dart';
import '../spacer.dart';

class RoundSmallAvatarWithName extends StatelessWidget {
  const RoundSmallAvatarWithName({
    Key? key,
    required this.user,
    this.showName = true,
  }) : super(key: key);
  final UserInfo user;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        // if (userInfoData.getInfoOK)
        CircleAvatar(
          backgroundImage: Image.network("$sugarHost/${user.avatar}").image,
          radius: AvatarRadius3,
          backgroundColor: CardWhiteColor,
        ),
        H10(),
        Text(
          user.nickName,
          style: theme.textTheme.bodyText1,
        )
      ],
    );
  }
}

class RoundAvatarWithVertialInfo extends StatelessWidget {
  const RoundAvatarWithVertialInfo(
      {Key? key, required this.user, this.radius = 30, this.showDes = true})
      : super(key: key);
  final User user;
  final double radius;
  final bool showDes;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // if (userInfoData.getInfoOK)
        CircleAvatar(
          backgroundImage: Image.network("$sugarHost/${user.avatar}").image,
          radius: radius,
          backgroundColor: CardWhiteColor,
        ),
        V10(),
        Text(
          user.nickName,
          style: theme.textTheme.bodyText1,
        ),
        if (showDes) Text(user.des),
      ],
    );
  }
}

class RoundAvatarWithInfoHeader extends StatefulWidget {
  const RoundAvatarWithInfoHeader(
      {Key? key, required this.userInfo, this.executes, this.isMe = false})
      : super(key: key);
  final UserInfo userInfo;
  final List<Widget>? executes;
  final bool isMe;

  @override
  _RoundAvatarWithInfoHeaderState createState() =>
      _RoundAvatarWithInfoHeaderState();
}

class _RoundAvatarWithInfoHeaderState extends State<RoundAvatarWithInfoHeader> {
  late UserInfoData userInfoData;
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

  @override
  void initState() {
    super.initState();
    userInfoData = UserInfoData(userID: widget.userInfo.userID);
    userInfoData.userInfo = widget.userInfo;
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
                    CircleAvatar(
                      backgroundImage: Image.network(
                              "$sugarHost/${userInfoData.userInfo!.avatar}")
                          .image,
                      radius: AvatarRadius1,
                      backgroundColor: CardWhiteColor,
                    ),
                    H10(),
                    Text(
                      userInfoData.userInfo!.nickName,
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
            Text(userInfoData.userInfo!.des),
          ],
        ),
      ),
    );
  }
}
