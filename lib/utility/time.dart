import 'package:intl/intl.dart';

String getTimeShowFromDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  var dateTimeShow = formatter.format(date.toLocal());
  return dateTimeShow;
}

String getTimeShowFromDayStamp(int dayStamp) {
  var date = getDateTimeFromDayStamp(dayStamp, 8);
  print("$date");
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var dateTimeShow = formatter.format(date.toLocal());
  return dateTimeShow;
}

List<DateTime> getTodayAndFutureDays(int count) {
  List<DateTime> days = [];
  var day = DateTime.now();
  for (var i = 0; i < count; i++) {
    days.add(day);
    day = day.add(Duration(days: 1));
  }
  return days;
}

int getDayStamp(DateTime day, int offset) {
  var ts = day.millisecondsSinceEpoch;
  var tsTrans = ts ~/ 1000 + offset * 3600;
  var ds = (tsTrans / (24 * 3600)).ceil();
  return ds;
}

int getTodayDayStamp(int offset) {
  var now = DateTime.now();
  return getDayStamp(now, offset);
}

DateTime getDateTimeFromDayStamp(int dayStamp, int offset) {
  var ts = 1000 * ((dayStamp - 1) * (24 * 3600) - offset * 3600);
  return DateTime.fromMillisecondsSinceEpoch(ts);
}

int getDayFromDayStamp(int dayStamp, int offset) {
  var dt = getDateTimeFromDayStamp(dayStamp, offset);
  var day = dt.day;
  return day;
}

DateTime getToday(int offset) {
  var now = DateTime.now();
  var today = DateTime.utc(now.year, now.month, now.day);
  var tzTodat = today.add(Duration(hours: -offset));
  return tzTodat;
}
