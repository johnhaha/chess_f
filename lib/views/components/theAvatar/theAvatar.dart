import 'package:template/configs/host.dart';
import 'package:template/constants/styles/colors.dart';
import 'package:template/views/components/spacer.dart';
import 'package:flutter/material.dart';

import 'data/userInfoData.dart';

class SmallAvatarWithName extends StatefulWidget {
  const SmallAvatarWithName({Key? key, required this.userID}) : super(key: key);
  final String userID;

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
        UserAvatar(
          userInfoData: userInfoData,
          radius: 20,
        ),
        H10(),
        if (userInfoData.getInfoOK)
          Text(
            "张三",
            style: theme.textTheme.bodyText1,
          )
      ],
    );
  }
}

class BigAvatarWithNameAndDes extends StatefulWidget {
  const BigAvatarWithNameAndDes({Key? key, required this.userID})
      : super(key: key);
  final String userID;

  @override
  _BigAvatarWithNameAndDesState createState() =>
      _BigAvatarWithNameAndDesState();
}

class _BigAvatarWithNameAndDesState extends State<BigAvatarWithNameAndDes> {
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
        UserAvatar(
          userInfoData: userInfoData,
          radius: 50,
        ),
        V10(),
        Text(
          userInfoData.getInfoOK ? userInfoData.userInfo!.nickName : "",
          style: theme.textTheme.headline2,
        ),
        if (userInfoData.getInfoOK) Text(userInfoData.userInfo!.des),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.userInfoData,
    required this.radius,
  }) : super(key: key);

  final UserInfoData userInfoData;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: userInfoData.getInfoOK &&
              userInfoData.userInfo!.avatar != ""
          ? Image.network("$SugarHost/${userInfoData.userInfo!.avatar}").image
          : null,
      radius: radius,
      backgroundColor: CardWhiteColor,
    );
  }
}
