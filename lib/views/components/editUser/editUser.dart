import 'dart:io';

import 'package:template/services/water/data.dart';
import 'package:template/views/components/AddImagePickerWithTitle.dart';
import 'package:template/views/components/editUser/editUserData.dart';
import 'package:template/views/components/interact/showLoading.dart';
import 'package:template/views/components/sheetWithHeadButtons.dart';
import 'package:template/views/components/spacer.dart';
import 'package:template/views/components/textInput.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditUser extends StatefulWidget {
  const EditUser(
      {Key? key, required this.userInfo, required this.updateUserInfo})
      : super(key: key);
  final UserInfo userInfo;
  final Function(UserInfo) updateUserInfo;

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  late EditUserData editUserData;
  late TextEditingController nicknameInput;
  late TextEditingController desInput;
  final picker = ImagePicker();
  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        print("get image ok");
        editUserData.avatar = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _updateUserInfo() async {
    showLoading(context);
    print("ouo");
    editUserData.userInfo.des = desInput.text;
    editUserData.userInfo.nickName = nicknameInput.text;
    var res = await editUserData.updateInfo();
    if (res) {
      widget.updateUserInfo(editUserData.userInfo);
      Navigator.pop(context);
    }
    hideLoading(context);
  }

  @override
  void initState() {
    super.initState();
    nicknameInput = TextEditingController(text: widget.userInfo.nickName);
    desInput = TextEditingController(text: widget.userInfo.des);
    editUserData = EditUserData(userInfo: widget.userInfo);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SheetWithHeadButton(children: [
      AddImagePickerWithTitle(
        getImage: _getImage,
        image: editUserData.avatar,
        isRound: true,
        name: '头像',
        imageID: editUserData.userInfo.avatar,
      ),
      V20(),
      CustomTextInput(
        textEditingController: nicknameInput,
        title: "昵称",
        width: size.width,
      ),
      V20(),
      CustomTextInput(
        textEditingController: desInput,
        title: "描述",
        maxLine: 2,
        width: size.width,
      )
    ], submit: _updateUserInfo);
  }
}
