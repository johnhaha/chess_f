import 'dart:io';
import 'api.dart';
import 'package:template/utility/image.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'image.dart';

var imageDioOptions = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

Future<List<ImageResData>?> uploadImage(List<File> images) async {
  var dio = Dio();
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