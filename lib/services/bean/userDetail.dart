import 'package:template/services/bean/api.dart';
import 'package:template/services/fastHttp.dart';

import 'data.dart';

// Future<CampusWithStudyNum?> getUserDetailCampusData(String userID) async {
//   var url = getUserDetailCampusBaseAddr + "/$userID";
//   GetUserDetailCampusRes getUserDetailCampusRes;
//   try {
//     var res = await fastGet(url);
//     if (res != null) {
//       getUserDetailCampusRes = GetUserDetailCampusRes.fromJson(res);
//       return getUserDetailCampusRes.data;
//     }
//   } catch (e) {}
// }

// class GetUserDetailCampusRes {
//   GetUserDetailCampusRes({
//     this.data,
//     required this.message,
//     required this.success,
//   });

//   CampusWithStudyNum? data;
//   String message;
//   bool success;

//   factory GetUserDetailCampusRes.fromJson(Map<String, dynamic> json) =>
//       GetUserDetailCampusRes(
//         data: CampusWithStudyNum.fromJson(json["data"]),
//         message: json["message"],
//         success: json["success"],
//       );
// }

Future<CampusUserDetailData?> getUserCampusDetailInfo(String userID) async {
  var url = getUserDetailCampusBaseAddr + "/$userID";
  GetUserDetailDataRes getUserDetailDataRes;
  try {
    var res = await fastGet(url);
    if (res != null) {
      getUserDetailDataRes = GetUserDetailDataRes.fromJson(res);
      print("mark2");
      print(getUserDetailDataRes.message);
      // print("get campus num: ${getUserCampusWithNumRes.data!.length}");
      return getUserDetailDataRes.data;
    }
  } catch (e) {
    print(e);
  }
}
