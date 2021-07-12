import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template/constants/colors.dart';
import 'package:template/constants/hosts.dart';
import 'package:template/data/common/user.dart';
import 'package:template/extensions/screen.dart';
import 'package:template/views/common/buttons/normalButton.dart';
import 'package:template/views/common/buttons/textButton.dart';
import 'package:template/views/common/images/AddImagePickerWithTitle.dart';
import 'package:template/views/common/inputs/textInput.dart';
import 'package:template/views/common/layout/spacer.dart';

import 'editUserData.dart';

Future showEditUserModel(BuildContext context, UserInfo userInfo,
    Function(UserInfo) onSubmit) async {
  showModalBottomSheet(
      backgroundColor: PageColor,
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      builder: (context) {
        return EditUserPop(
          userInfo: userInfo,
          updateUserInfo: onSubmit,
        );
      });
}

class EditUserPop extends StatefulWidget {
  const EditUserPop(
      {Key? key, required this.userInfo, required this.updateUserInfo})
      : super(key: key);
  final UserInfo userInfo;
  final Function(UserInfo) updateUserInfo;

  @override
  _EditUserPopState createState() => _EditUserPopState();
}

class _EditUserPopState extends State<EditUserPop> {
  late EditUserData editUserData;
  File? _image;
  var _nameInput = TextEditingController();
  var _desInput = TextEditingController();
  final picker = ImagePicker();
  late FocusNode nameFocus;
  late FocusNode desFocus;
  var buttonKey = UniqueKey();
  var modalHeight = 350.0;
  var submiting = false;
  void _inputListon() {
    if (nameFocus.hasFocus || desFocus.hasFocus) {
      print("yeah");
      setState(() {
        modalHeight = 650;
      });
    } else {
      setState(() {
        modalHeight = 350;
      });
    }
  }

  Future _getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print("get image ok");
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }

    setState(() {});
  }

  Future _updateUserInfo() async {
    submiting = true;
    print("ouo");
    editUserData.userInfo.des = _desInput.text;
    editUserData.userInfo.nickName = _nameInput.text;
    editUserData.avatar = _image;
    var res = await editUserData.updateInfo();
    if (res) {
      widget.updateUserInfo(editUserData.userInfo);
      Navigator.pop(context);
    }
    setState(() {
      buttonKey = UniqueKey();
    });
    submiting = false;
  }

  @override
  void initState() {
    super.initState();
    editUserData = EditUserData(userInfo: widget.userInfo);
    _nameInput.text = widget.userInfo.nickName;
    _desInput.text = widget.userInfo.des;
    nameFocus = FocusNode();
    nameFocus.addListener(() {
      _inputListon();
    });
    desFocus = FocusNode();
    desFocus.addListener(() {
      _inputListon();
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = context.getSize();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.hideKeyboard(),
      child: Container(
        height: modalHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NormalTextButton(
                    txt: "取消",
                    onPress: () {
                      if (!submiting) {
                        Navigator.pop(context);
                      }
                    },
                    style: TheButtonStyle.clickable,
                    // isHighlight: true,
                  ),
                  NormalButton(
                      key: buttonKey, title: "确认", onPress: _updateUserInfo)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  AddImagePickerWithTitle(
                    getImage: _getImage,
                    image: _image,
                    name: "",
                    imageUrl: widget.userInfo.avatar != ""
                        ? "$imageHost/${widget.userInfo.avatar}"
                        : "",
                    width: 100,
                    radius: 18,
                  ),
                  // H10(),
                  CustomTextInput(
                    textEditingController: _nameInput,
                    title: "",
                    width: 200,
                    height: 40,
                    focusNode: nameFocus,
                  )
                ],
              ),
            ),
            V20(),
            CustomTextInput(
              textEditingController: _desInput,
              title: "",
              width: _size.width - 40,
              height: 80,
              focusNode: desFocus,
            )
          ],
        ),
      ),
    );
  }
}
