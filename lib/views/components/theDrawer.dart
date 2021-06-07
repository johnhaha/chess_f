import 'package:template/constants/configs.dart';
import 'package:template/constants/theme.dart';
import 'package:template/data/userData.dart';
import 'package:template/views/components/contactUs/contactUs.dart';
import 'package:template/views/components/login/login.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/theButtons.dart';
import 'package:flutter/material.dart';
import 'package:template/extensions/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/extensions/navigator.dart';

Drawer theDrawer(BuildContext context) {
  return Drawer(
    child: Consumer(builder: (context, watch, child) {
      var login = watch(userData).login;
      var user = watch(userData).user;
      return Stack(
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
                  txt: '联系我们',
                  onPress: () {
                    context.push(ContactUs());
                  },
                  // isHighlight: true,
                ),
                V20(),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              child: login
                  ? NormalTextButton(
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
      );
    }),
  );
}
