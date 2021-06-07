import 'package:template/services/sugar/data.dart';
import 'package:template/services/sugar/getImageInfo.dart';

class TheImageViewData {
  TheImageViewData({required this.imageID});
  String imageID;
  ImageInfo? imageInfo;
  bool getImageInfoOK = false;
  Future getImageInfo() async {
    imageInfo = await getImageInfoWithFileID(imageID);
    getImageInfoOK = imageInfo != null;
  }
}
