import 'dart:io';

import 'package:dio/dio.dart';
import 'package:template/handlers/image.dart';
import 'package:http_parser/http_parser.dart';
import 'package:template/services/sugar/res.dart';

import 'api.dart';

var imageDioOptions = BaseOptions(
  connectTimeout: 8000,
  receiveTimeout: 5000,
);

Future<List<ImageResData>?> uploadImage(List<File> images) async {
  var dio = Dio(imageDioOptions);
  var num = images.length;
  var formData = FormData();
  formData.fields.add(MapEntry("num", "$num"));
  for (var i = 0; i < num; i++) {
    var imageData = resizeImage(images[i], ImageSize.Normal);
    formData.files.add(MapEntry(
        "image$i",
        MultipartFile.fromBytes(getJpgData(imageData, quality: 70),
            filename: "image$i.jpg", contentType: MediaType('image', 'jpeg'))));
  }
  var response = await dio.post(
    uploadMultipleImagesAddr,
    data: formData,
    onSendProgress: (received, total) {
      if (total != -1) {
        print((received / total * 100).toStringAsFixed(0) + '%');
      }
    },
  );
  MultipleImageUploadRes multipleImageUploadRes;
  if (response.statusCode == 200) {
    Map<String, dynamic> resData = response.data;
    multipleImageUploadRes = MultipleImageUploadRes.fromJson(resData);
    return multipleImageUploadRes.data;
  } else {
    return null;
  }
}
