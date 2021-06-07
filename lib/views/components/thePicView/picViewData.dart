import 'package:template/services/sugar/data.dart';
import 'package:template/services/sugar/pic.dart';

class PicViewData {
  PicViewData({required this.picID});
  String picID;
  Pic? pic;
  Future<bool> getPicViewInfo() async {
    var res = await getPicInfo(picID);
    if (res != null) {
      pic = res;
      return true;
    }
    return false;
  }
}
