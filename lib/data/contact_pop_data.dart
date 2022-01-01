import 'package:chess/grap/generated/grap.pb.dart';
import 'package:chess/grap/service.dart';
import 'package:steam/contact.dart';

class ContactPopData {
  List<ContactInfo> _userContact = [];
  List<String> get contactTel => _userContact.map((e) => e.phone).toList();
  List<GrapUser> _contactUsers = [];

  List<ContactInfo> get registeredContact =>
      _userContact.where((element) => element.isUser).toList();
  List<ContactInfo> get unRegisteredContact =>
      _userContact.where((element) => !element.isUser).toList();

  var service = GrapService();

  void _setRegisteredContact() {
    for (var i = 0; i < _userContact.length; i++) {
      var index = _contactUsers
          .indexWhere((element) => element.tel == _userContact[i].phone);
      if (index >= 0) {
        _userContact[i].bindUser(
            id: _contactUsers[index].userID,
            avatar: _contactUsers[index].avatar,
            name: _contactUsers[index].name);
      }
    }
  }

  Future getUserContactUser() async {
    try {
      var contacts = await SteamContacts.getContacts();
      // print("❤️ contact length is ${contacts.length}");
      if (contacts.isEmpty) {
        return;
      }
      _userContact = contacts;
      var res = await service.getManyTelUser(contactTel);
      _contactUsers = res;
      _setRegisteredContact();
    } catch (e) {
      rethrow;
    }
  }

  ///get user with code
  Future<GrapUser> getUserWithCode(String code) async {
    try {
      var res = await service.getUserWithCode(code);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
