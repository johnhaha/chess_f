import 'dart:io';

import 'package:template/services/sugar/data.dart';
import 'package:template/services/sugar/pic.dart';
import 'package:template/services/sugar/post.dart';

class AddPostPageData {
  AddPostPageData(
      {required this.posterID,
      required this.posterType,
      required this.targetID,
      required this.targetType});

  String posterID;
  String posterType;
  String targetID;
  String targetType;

  Future<Post?> addPagePost(
      String des, PostType postType, String contentID) async {
    var res = await addPost(
        postType, contentID, des, posterID, posterType, targetID, targetType);
    return res;
  }

  Future<Post?> addCampusPicPost(List<File> images, String des) async {
    var picRes = await addPic(images);
    if (picRes != null) {
      var picID = picRes.picId;
      var postRes = await addPagePost(des, PostType.pic, picID);
      return postRes;
    }
  }
}
