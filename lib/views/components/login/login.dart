import 'package:template/constants/colors.dart';
import 'package:template/constants/configs.dart';
import 'package:template/constants/theme.dart';
import 'package:template/views/components/interact/showLoading.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/textInput.dart';
import 'package:template/views/components/theButtons.dart';
import 'package:template/views/components/theWebView.dart';

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:template/extensions/login.dart';
import 'package:template/extensions/navigator.dart';

import 'loginData.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController telInput;
  final TextEditingController _pinPutInput = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final FocusNode _telInputFocusNode = FocusNode();

  var userAgree = true;
  var loginData = LoginData();
  var userInputing = false;

  void _userAgreeToggle() {
    userAgree = !userAgree;
    setState(() {});
  }

  void _goUserAgreePage() {
    context.push(TheWebView(title: "用户协议", source: UserAgreeUrl));
  }

  void _telInputHandle() {
    if (userInputing != _telInputFocusNode.hasFocus) {
      userInputing = _telInputFocusNode.hasFocus;
      setState(() {});
    }
  }

  Future _telLogin() async {
    showLoading(context);
    var res = await loginData.userTelLogin(telInput.text);
    if (res) {
      loginData.loginStep = 2;
      setState(() {});
    }
    hideLoading(context);
  }

  Future _checkTelLoginCode(String code) async {
    var res = await loginData.checkTelCode(telInput.text, code);
    if (res != null && res.success) {
      print("yesh, login successed");
      context.login(res.data!, res.token!);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    telInput = TextEditingController();
    _telInputFocusNode.addListener(_telInputHandle);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PageColor,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 32,
                    ),
                  ),
                  V60(),
                  Text(loginData.loginStep == 1 ? "手机号" : "验证码",
                      style: bigTitle),
                  V60(),
                  if (!userInputing) V60(),
                  if (loginData.loginStep == 1)
                    Container(
                      child: CustomTextInput(
                        focusNode: _telInputFocusNode,
                        textEditingController: telInput,
                        title: "",
                        width: size.width,
                        keyBoard: TextInputType.number,
                      ),
                    ),
                  if (loginData.loginStep == 2)
                    Center(
                      child: Container(
                        width: size.width - 100,
                        child: PinPut(
                          autofocus: true,
                          fieldsCount: 6,
                          onSubmit: (String pin) {
                            print(pin);
                            _checkTelLoginCode(pin);
                          },
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutInput,
                          submittedFieldDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: TextColor,
                            ),
                          ),
                          selectedFieldDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: TextColor,
                            ),
                          ),
                          followingFieldDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: DisColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  V60(),
                  // V60(),
                  if (loginData.loginStep == 1)
                    Center(
                        child: BigButton(
                      onPress: _telLogin,
                      disabled: !userAgree,
                      txt: '下一步',
                    )),
                  V60(),
                  if (loginData.loginStep == 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            checkColor: PageColor,
                            activeColor: MainColor,
                            value: userAgree,
                            onChanged: (value) {
                              _userAgreeToggle();
                            }),
                        GestureDetector(
                          onTap: _goUserAgreePage,
                          child: Text(
                            "同意《用户协议》",
                            style: bodyText1,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
