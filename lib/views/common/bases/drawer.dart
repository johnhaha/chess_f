import 'package:template/constants/colors.dart';
import 'package:template/constants/configs.dart';
import 'package:template/constants/info.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (login)
                    Text(
                      user!.nickName,
                      style: titleText3,
                    ),
                  V10(),
                  Text("$AppName V$AppVersion"),
                  V10(),
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
                      context
                          .push(TheWebView(title: "隐私政策", source: PrivacyUrl));
                    },
                    // isHighlight: true,
                  ),
                  V10(),
                ],
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
