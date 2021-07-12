import 'package:template/constants/hosts.dart';
import 'package:template/data/common/place.dart';
import 'package:template/services/app/common/req.dart';
import 'package:template/services/app/common/res.dart';
import 'package:template/utility/fastHttp.dart';

import 'api.dart';

class PlaceService {
  static Future<List<List<TXPlace>>?> getTXPlaces() async {
    var url = getTXPlacesAddr;
    GetTxPlacesRes getTxPlacesRes;
    try {
      var res = await fastGet(url);
      if (res != null) {
        getTxPlacesRes = GetTxPlacesRes.fromJson(res);
        return getTxPlacesRes.data;
      }
    } catch (e) {
      print("something went wrong getting places🐶");
      print(e);
    }
  }

  static Future<Place?> addPlace(AddPlaceReq req) async {
    var url = addPlaceAddr;
    var body = req.toJson();
    AddPlaceRes addPlaceRes;
    try {
      var res = await fastPost(url, body);
      if (res != null) {
        addPlaceRes = AddPlaceRes.fromJson(res);
        print(addPlaceRes.message);
        return addPlaceRes.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
