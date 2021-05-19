import 'package:intl/intl.dart';

String getTimeShowFromDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  var dateTimeShow = formatter.format(date.toLocal());
  return dateTimeShow;
}
