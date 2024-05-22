String convertDateToString(DateTime date) {
  String year = date.year.toString();
  String month = date.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  String day = date.day.toString();
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
