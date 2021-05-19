class MultipleImageUploadRes {
  MultipleImageUploadRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<ImageInfo>? data;
  String message;
  bool success;

  factory MultipleImageUploadRes.fromJson(Map<String, dynamic> json) =>
      MultipleImageUploadRes(
        data: json["data"] != null
            ? List<ImageInfo>.from(
                json["data"].map((x) => ImageInfo.fromJson(x)))
            : [],
        message: json["message"],
        success: json["success"],
      );
}

class ImageInfo {
  ImageInfo({
    required this.fileId,
    required this.path,
  });

  String fileId;
  String path;

  factory ImageInfo.fromJson(Map<String, dynamic> json) => ImageInfo(
        fileId: json["fileID"],
        path: json["path"],
      );
}
