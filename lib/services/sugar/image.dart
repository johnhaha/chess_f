class MultipleImageUploadRes {
  MultipleImageUploadRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<ImageResData>? data;
  String message;
  bool success;

  factory MultipleImageUploadRes.fromJson(Map<String, dynamic> json) =>
      MultipleImageUploadRes(
        data: json["data"] != null
            ? List<ImageResData>.from(
                json["data"].map((x) => ImageResData.fromJson(x)))
            : [],
        message: json["message"],
        success: json["success"],
      );
}

class ImageResData {
  ImageResData({
    required this.fileId,
    required this.path,
  });

  String fileId;
  String path;

  factory ImageResData.fromJson(Map<String, dynamic> json) => ImageResData(
        fileId: json["fileID"],
        path: json["path"],
      );
}
