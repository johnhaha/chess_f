import 'dart:io';

import 'package:template/services/sugar/image.dart';
import 'package:template/services/sugar/imageUpload.dart';
import 'package:template/services/water/data.dart';
import 'package:template/services/water/handlers.dart';

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
    var res = await updateUserInfo(
        imagePath, userInfo.des, userInfo.nickName, userInfo.userID);
    return res;
  }
}
