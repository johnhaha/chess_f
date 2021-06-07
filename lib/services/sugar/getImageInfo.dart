import 'api.dart';

import 'package:template/services/fastHttp.dart';

import 'data.dart';

Future<ImageInfo?> getImageInfoWithFileID(String fileID) async {
  var url = getImageInfoWithFileIDBaseAddr + "/$fileID";
  GetImageInfoRes getImageInfoRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getImageInfoRes = GetImageInfoRes.fromJson(res);
      return getImageInfoRes.data;
    }
  } catch (e) {
    print(e);
  }
}

class GetImageInfoRes {
  GetImageInfoRes({
    this.data,
    required this.message,
    required this.success,
  });

  ImageInfo? data;
  String message;
  bool success;

  factory GetImageInfoRes.fromJson(Map<String, dynamic> json) =>
      GetImageInfoRes(
        data: ImageInfo.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
