String convertDateToString(String date) {
  DateTime dateTime = DateTime.parse(date);
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
  String yyyymmdd = year + month + day;
  return yyyymmdd;
}

String getNameDay(DateTime date) {
  switch (date.weekday) {
    case 1:
      return 'Sun';
    case 2:
      return 'Mon';
    case 3:
      return 'Tue';
    case 4:
      return 'Wed';
    case 5:
      return 'Thur';
    case 6:
      return 'Fri';
    case 7:
      return 'Sat';
    default:
      return '';
  }
}

DateTime startOfWeek() {
  DateTime? startOfWeek;
  DateTime date = DateTime.now();
  for (int i = 0; i < 7; i++) {
    if (getNameDay(date.subtract(Duration(days: i))) == 'Sun') {
      startOfWeek = date.subtract(Duration(days: i));
    }
  }
  return startOfWeek!;
}
