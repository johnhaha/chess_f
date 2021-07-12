import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/data/common/user.dart';
import 'package:template/views/common/bases/sheetWithHeadButtons.dart';
import 'package:template/views/common/images/AddImagePickerWithTitle.dart';
import 'package:template/views/common/inputs/textInput.dart';
import 'package:template/views/common/layout/spacer.dart';
import 'package:template/views/common/popups/showLoading.dart';

import 'editUserData.dart';

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
    if (pickedFile != null) {
      print("get image ok");
      editUserData.avatar = File(pickedFile.path);
    } else {
      print('No image selected.');
    }

    setState(() {});
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
    return SheetWithHeadButton(
      children: [
        AddImagePickerWithTitle(
          getImage: _getImage,
          image: editUserData.avatar,
          isRound: true,
          name: '头像',
          imageUrl: editUserData.userInfo.avatar,
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
      ],
      submit: _updateUserInfo,
      back: Icon(Icons.close),
    );
  }
}
