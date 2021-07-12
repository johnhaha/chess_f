import 'package:template/services/fork/feedback.dart';

class ContactUsData {
  Future<bool> addContactFeedback(
      String userID, String content, bool login) async {
    var res = await FeedbackService.addFeedback(userID, content, login);
    return res;
  }
}
