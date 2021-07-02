import 'package:template/constants/colors.dart';
import 'package:template/constants/theme.dart';

import 'package:flutter/material.dart';
import 'package:template/extensions/navigator.dart';
import 'package:template/views/common/bases/login/login.dart';
import 'package:template/views/common/buttons/bigButton.dart';
import 'package:template/views/common/layout/spacer.dart';

class NoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              V60(),
              V60(),
              Text(
                "未登录",
                style: bigTitle,
              ),
              V60(),
              V60(),
              V60(),
              BigButton(
                  txt: "登录",
                  onPress: () {
                    context.popUp(Login());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
