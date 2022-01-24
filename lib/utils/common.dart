import 'package:intl/intl.dart';

formatDate(String date) {
  return DateFormat.yMMMd("ko_KR").format(DateTime.parse(date));
}
