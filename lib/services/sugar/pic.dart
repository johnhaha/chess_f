import 'dart:io';

import 'package:template/constants/configs.dart';
import 'package:template/services/fastHttp.dart';
import 'package:template/services/sugar/api.dart';
import 'package:template/services/sugar/data.dart';
import 'package:template/utility/image.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

Future<Pic?> addPic(List<File> images) async {
  var dio = Dio();
  var num = images.length;
  var formData = FormData();
  formData.fields.add(MapEntry("app", "$AppName"));
  formData.fields.add(MapEntry("num", "$num"));
  for (var i = 0; i < num; i++) {
    var imageData = resizeImage(images[i], ImageSize.Normal);
    formData.files.add(MapEntry(
        "image$i",
        MultipartFile.fromBytes(getJpgData(imageData, quality: 70),
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
  AddPicRes addPicRes;
  if (response.statusCode == 200) {
    Map<String, dynamic> resData = response.data;
    addPicRes = AddPicRes.fromJson(resData);
    return addPicRes.data;
  } else {
    return null;
  }
}

Future<Pic?> getPicInfo(String picID) async {
  var url = getPicInfoBaseAddr + "/$picID";
  GetPicRes getPicRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getPicRes = GetPicRes.fromJson(res);
      return getPicRes.data;
    }
  } catch (e) {
    print(e);
  }
}

class GetPicRes {
  GetPicRes({
    this.data,
    required this.message,
    required this.success,
  });

  Pic? data;
  String message;
  bool success;

  factory GetPicRes.fromJson(Map<String, dynamic> json) => GetPicRes(
        data: Pic.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
