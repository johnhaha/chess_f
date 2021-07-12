import 'package:template/constants/colors.dart';
import 'package:template/constants/configs.dart';
import 'package:template/constants/info.dart';
import 'package:template/constants/size.dart';
import 'package:template/constants/theme.dart';
import 'package:template/data/userData.dart';

import 'package:flutter/material.dart';
import 'package:template/extensions/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/extensions/navigator.dart';
import 'package:template/views/common/bases/webView.dart';
import 'package:template/views/common/buttons/normalButton.dart';
import 'package:template/views/common/buttons/textButton.dart';
import 'package:template/views/common/layout/spacer.dart';
import 'package:template/views/common/layout/theVerticalDivider.dart';

import 'contactUs/contactUs.dart';
import 'login/login.dart';

Drawer theDrawer(BuildContext context) {
  return Drawer(
    child: Consumer(builder: (context, watch, child) {
      var login = watch(userData).login;
      var user = watch(userData).user;
      return Container(
        color: PageColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "我的钱包",
                              style: bodyText1,
                            ),
                            NormalTextButton(txt: '查看明细', onPress: () {})
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: CardWhiteColor,
                              borderRadius:
                                  BorderRadius.circular(BorderRadiusSize3)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TitieAndStatics(
                                  statics: 3000,
                                  title: '总金额',
                                ),
                                TheVerticalDivider(height: 60),
                                TitieAndStatics(title: '可提现', statics: 300)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    V20(),
                    NameAndDes(
                      name: '我的关注',
                      des: "222",
                    ),
                    V20(),
                    NameAndDes(
                      name: '我的订单',
                      des: "21",
                    ),
                    V20(),
                    NameAndDes(
                      name: '版本',
                      des: "$AppName V$AppVersion",
                    ),
                    V20(),
                    NormalTextButton(
                      txt: '👋 联系我们',
                      onPress: () {
                        context.push(ContactUs());
                      },
                      // isHighlight: true,
                    ),
                    V10(),
                    NormalTextButton(
                      txt: '📝 用户协议',
                      onPress: () {
                        context.push(
                            TheWebView(title: "用户协议", source: UserAgreeUrl));
                      },
                      // isHighlight: true,
                    ),
                    V10(),
                    NormalTextButton(
                      txt: '🔒 隐私政策',
                      onPress: () {
                        context.push(
                            TheWebView(title: "隐私政策", source: PrivacyUrl));
                      },
                      // isHighlight: true,
                    ),
                    V10(),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                child: login
                    ? NormalTextButton(
                        style: TheButtonStyle.alert,
                        onPress: () {
                          print("log out now");
                          context.userSignOut();
                        },
                        txt: '退出登录',
                      )
                    : NormalButton(
                        title: "登录",
                        onPress: () {
                          context.popUp(Login());
                        }))
          ],
        ),
      );
    }),
  );
}

class TitieAndStatics extends StatelessWidget {
  const TitieAndStatics({
    Key? key,
    required this.title,
    required this.statics,
  }) : super(key: key);
  final String title;
  final int statics;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        V10(),
        Text(
          '$statics',
          style: bodyText1,
        )
      ],
    );
  }
}

class NameAndDes extends StatelessWidget {
  const NameAndDes({
    Key? key,
    required this.name,
    required this.des,
  }) : super(key: key);
  final String name;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: bodyText1,
        ),
        Text(des),
      ],
    );
  }
}
