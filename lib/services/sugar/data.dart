class ImageInfo {
  ImageInfo({
    required this.createdAt,
    required this.updatedAt,
    required this.size,
    required this.formate,
    required this.fileId,
    required this.url,
    required this.width,
    required this.height,
  });

  DateTime createdAt;
  DateTime updatedAt;
  int size;
  String formate;
  String fileId;
  String url;
  int width;
  int height;

  factory ImageInfo.fromJson(Map<String, dynamic> json) => ImageInfo(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        size: json["size"],
        formate: json["formate"],
        fileId: json["fileID"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}

class Post {
  Post({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.pid,
    required this.contentType,
    required this.contentId,
    required this.des,
    required this.posterId,
    required this.posterType,
    required this.targetId,
    required this.targetType,
    required this.app,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String pid;
  PostType contentType;
  String contentId;
  String des;
  String posterId;
  String posterType;
  String targetId;
  String targetType;
  String app;
  int status;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        pid: json["pid"],
        contentType: getPostType(json["contentType"]),
        contentId: json["contentID"],
        des: json["des"],
        posterId: json["posterID"],
        posterType: json["posterType"],
        targetId: json["targetID"],
        targetType: json["targetType"],
        app: json["app"],
        status: json["status"],
      );
}

//res
class AddPostRes {
  AddPostRes({
    this.data,
    required this.message,
    required this.success,
  });

  Post? data;
  String message;
  bool success;

  factory AddPostRes.fromJson(Map<String, dynamic> json) => AddPostRes(
        data: Post.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class GetTargetPostRes {
  GetTargetPostRes({
    this.data,
    required this.message,
    required this.success,
  });

  List<Post>? data;
  String message;
  bool success;

  factory GetTargetPostRes.fromJson(Map<String, dynamic> json) =>
      GetTargetPostRes(
        data: List<Post>.from(json["data"].map((x) => Post.fromJson(x))),
        message: json["message"],
        success: json["success"],
      );
}

enum PostType { text, pic, unknown }

String getPostTypeStr(PostType postType) {
  switch (postType) {
    case PostType.text:
      return "text";
    case PostType.pic:
      return "pic";
    case PostType.unknown:
      return "unknown";
  }
}

PostType getPostType(String postTypeStr) {
  switch (postTypeStr) {
    case "text":
      return PostType.text;
    case "pic":
      return PostType.pic;
    default:
      return PostType.unknown;
  }
}

//pic
class Pic {
  Pic({
    required this.picId,
    required this.images,
    required this.imageNum,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  String picId;
  List<String> images;
  int imageNum;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pic.fromJson(Map<String, dynamic> json) => Pic(
        picId: json["picID"],
        images: List<String>.from(json["images"].map((x) => x)),
        imageNum: json["imageNum"],
        status: json["status"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
      );
}

//add pic
class AddPicRes {
  AddPicRes({
    this.data,
    required this.message,
    required this.success,
  });

  Pic? data;
  String message;
  bool success;

  factory AddPicRes.fromJson(Map<String, dynamic> json) => AddPicRes(
        data: Pic.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}
