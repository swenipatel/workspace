import 'package:intl/intl.dart';

void main() {
  var now = DateTime.now();

  print(DateFormat.yMMMMd('en_US').format(now));
  print(NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(12345));
}