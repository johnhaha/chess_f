import 'dart:io';

import 'package:template/data/common/user.dart';
import 'package:template/services/app/common/user.dart';
import 'package:template/services/sugar/image.dart';
import 'package:template/services/sugar/res.dart';

class EditUserData {
  EditUserData({required this.userInfo});
  File? avatar;
  UserInfo userInfo;
  Future<bool> updateInfo() async {
    String imagePath = userInfo.avatar;
    if (avatar != null) {
      List<ImageResData>? imageInfo;
      try {
        imageInfo = await uploadImage([avatar!]);
      } catch (e) {
        print(e);
        return false;
      }
      if (imageInfo != null && imageInfo.length > 0) {
        imagePath = imageInfo[0].path;
        userInfo.avatar = imagePath;
      } else {
        return false;
      }
    }
    var res = await UserService.updateUserInfo(
      userInfo.userID,
      userInfo.nickName,
      userInfo.des,
      imagePath,
    );
    return res;
  }
}
