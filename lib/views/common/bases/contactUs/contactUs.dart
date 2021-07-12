import 'package:template/constants/assets.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/contact.dart';
import 'package:template/extensions/screen.dart';
import 'package:flutter/material.dart';
import 'package:template/views/common/bases/appBar.dart';
import 'package:template/views/common/buttons/bigButton.dart';
import 'package:template/views/common/inputs/textInput.dart';
import 'package:template/views/common/layout/spacer.dart';
import 'package:template/views/common/popups/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:template/extensions/userInfo.dart';

import 'contactUsData.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var contactInput = TextEditingController();
  var contactUsData = ContactUsData();

  Future _addFeedback() async {
    if (contactInput.text != "") {
      var login = context.getUserLogin();
      var userID = context.getUserID() ?? "";
      var res = await contactUsData.addContactFeedback(
          userID, contactInput.text, login);
      if (res) {
        contactInput.text = "";
        FocusScope.of(context).unfocus();
        showTextToast(context, "感谢你的反馈❤️");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: theAppBar(context, "联系我们"),
      backgroundColor: PageColor,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => context.hideKeyboard(),
        child: ListView(
          children: [
            V60(),
            CustomTextInput(
                maxLine: 10,
                height: 200,
                textEditingController: contactInput,
                title: "",
                width: size.width),
            V60(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BigButton(txt: "发送", onPress: _addFeedback),
            ),
            V60(),
            Center(
              child: Column(
                children: [
                  Text("找到我们"),
                  V20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LogoImageFromNet(
                        url: weiboLogo,
                        canJump: true,
                        target: WeiboSpace,
                      ),
                      LogoImageFromNet(
                        url: biliLogo,
                        canJump: true,
                        target: BiliSpace,
                      ),
                      LogoImageFromNet(
                        url: twitterLogo,
                        canJump: true,
                        target: TwitterSpace,
                      ),
                      LogoImageFromNet(
                        url: insLogo,
                        canJump: true,
                        target: InsSpace,
                      )
                    ],
                  )
                ],
              ),
            ),
            V60(),
            V60()
          ],
        ),
      ),
    );
  }
}

class LogoImageFromNet extends StatelessWidget {
  const LogoImageFromNet({
    Key? key,
    required this.url,
    required this.canJump,
    this.target,
  }) : super(key: key);
  final String url;
  final bool canJump;
  final String? target;

  Future _openTarget() async {
    if (target != null) {
      try {
        await launch(target!);
      } catch (e) {
        print("can not launch");
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openTarget,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            url,
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          )),
    );
  }
}
