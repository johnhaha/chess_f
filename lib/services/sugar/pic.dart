import 'dart:io';

import 'package:dio/dio.dart';
import 'package:template/constants/info.dart';
import 'package:template/data/common/content.dart';
import 'package:template/handlers/image.dart';
import 'package:http_parser/http_parser.dart';

import 'api.dart';
import 'image.dart';

Future<Content?> addPic(List<File> images) async {
  var dio = Dio(imageDioOptions);
  var num = images.length;
  var formData = FormData();
  formData.fields.add(MapEntry("app", "$AppName"));
  formData.fields.add(MapEntry("num", "$num"));
  for (var i = 0; i < num; i++) {
    var imageData = resizeImage(images[i], ImageSize.Big);
    formData.files.add(MapEntry(
        "image$i",
        MultipartFile.fromBytes(getJpgData(imageData, quality: 80),
            filename: "image$i.jpg", contentType: MediaType('image', 'jpeg'))));
  }
  var response = await dio.post(
    addPicAddr,
    data: formData,
    onSendProgress: (received, total) {
      if (total != -1) {
        print((received / total * 100).toStringAsFixed(0) + '%');
      }
    },
  );
  AddContentRes addContentRes;
  if (response.statusCode == 200) {
    Map<String, dynamic> resData = response.data;
    addContentRes = AddContentRes.fromJson(resData);
    return addContentRes.data;
  } else {
    return null;
  }
}
