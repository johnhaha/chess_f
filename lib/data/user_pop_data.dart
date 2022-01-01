import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/grap/service.dart';
import 'package:hey/model/user.dart';

class UserPopData {
  UserPopData({
    required this.userID,
  });
  final String userID;
  GrapUser? _user;

  GrapUser? get user => _user;

  set setUser(GrapUser u) {
    _user = u;
  }

  void updateFromUserInfo(UserInfo info) {
    _user!.avatar = info.avatar;
    _user!.name = info.nickName;
    _user!.des = info.des;
  }

  var service = GrapService();

  Future getUserData() async {
    try {
      var res = await service.getUserInfo(userID);
      setUser = res;
    } catch (e) {
      rethrow;
    }
  }
}
