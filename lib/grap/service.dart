import 'package:chess/constants/configs.dart';
import 'package:chess/grap/generated/grap.pbgrpc.dart';
import 'package:pump/shared.dart';

class GrapService {
  final grapClient = GrapClient(grapHost.grpcChannel(sharedEnv));
  Future<GrapUser> getUserInfo(String userID) async {
    try {
      var res = await grapClient.getUserInfo(UserReq(userID: userID));
      return res.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<GrapUser>> getManyTelUser(List<String> tel) async {
    try {
      var res = await grapClient.getManyTelUser(ManyTelReq(tel: tel));
      return res.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserAndCodeRes> getUserAndCode(String userID) async {
    try {
      var res = await grapClient.getUserAndCode(UserReq(userID: userID));
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<GrapUser> getUserWithCode(String code) async {
    try {
      var res = await grapClient.getUserWithCode(CodeReq(code: code));
      return res.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatCode> getUserCode(String userID) async {
    try {
      var res = await grapClient.getUserCode(UserReq(userID: userID));
      return res.code;
    } catch (e) {
      rethrow;
    }
  }
}
