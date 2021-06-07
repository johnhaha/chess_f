import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 3000,
  validateStatus: (status) {
    return status != null && status <= 500;
  },
);

Future<Map<String, dynamic>?> fastGet(String url,
    {auth = false, token = ''}) async {
  var dio = Dio(options);
  if (auth) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
  try {
    var response = await dio.get(url);
    Map<String, dynamic> resData = response.data;
    if (response.statusCode == 200) {
      print(resData['message']);
      return resData;
    } else {
      return {"message": resData['message'], "success": false};
    }
  } catch (e) {
    print(e);
    return {"message": e.toString(), "success": false};
  }
}

Future<Map<String, dynamic>?> fastPost(String url, Map<String, dynamic> body,
    {auth = false, token = '', isSearch = false}) async {
  var dio = Dio(options);
  if (auth) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
  if (isSearch) {
    dio.options.headers['X-Meili-API-Key'] = 'Y0urVery-S3cureAp1K3y';
  }
  try {
    var response = await dio.post(url, data: body);
    Map<String, dynamic> resData = response.data;
    if (response.statusCode == 200) {
      print(resData['message']);
      return resData;
    } else {
      print(response.data['message']);
      return {"message": resData['message'], "success": false};
    }
  } catch (e) {
    print(e);
    return {"message": e.toString(), "success": false};
  }
}

class MsgRes {
  String message;
  bool success;
  MsgRes({required this.success, required this.message});

  factory MsgRes.fromJson(Map<String, dynamic> json) =>
      MsgRes(success: json['success'], message: json['message']);
}
