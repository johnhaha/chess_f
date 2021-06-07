import 'package:template/constants/configs.dart';
import 'package:template/services/pasta/api.dart';

import 'package:template/services/fastHttp.dart';
import 'package:template/services/water/data.dart';
import 'package:template/services/water/handlers.dart';

import 'data.dart';

Future<List<Item>?> getPastaItems(String itemType) async {
  var url = getPastaItemsAddr;
  var body = {"itemType": itemType, "app": AppName};
  GetPastaItemRes getPastaItemRes;
  try {
    var res = await fastPost(url, body);
    if (res != null) {
      getPastaItemRes = GetPastaItemRes.fromJson(res);
      return getPastaItemRes.data;
    }
  } catch (e) {
    print(e);
  }
}

class GetPastaItemRes {
  GetPastaItemRes({
    required this.message,
    required this.success,
    this.data,
  });

  String message;
  bool success;
  List<Item>? data;

  factory GetPastaItemRes.fromJson(Map<String, dynamic> json) =>
      GetPastaItemRes(
        message: json["message"],
        success: json["success"],
        data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
      );
}

Future<List<Item>?> searchItems(
    String keyword, int offset, int limit, String type) async {
  var url = searchAddr;
  var body = {
    "keyword": keyword,
    "app": AppName,
    "offset": offset,
    "limit": limit,
    "type": type
  };
  SearchRes searchRes;
  try {
    var res = await fastPost(url, body, isSearch: true);
    if (res != null) {
      searchRes = SearchRes.fromJson(res);
      if (searchRes.success) {
        return searchRes.data!.hits;
      }
    }
  } catch (e) {
    print(e);
  }
}

Future<List<User>?> getUsersFromItem(List<Item> items) async {
  var userIDs = items.map((e) => e.itemId);
  var users = await getManyUsers(userIDs.toList());
  return users;
}
