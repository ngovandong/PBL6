import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toShowUIDate() {
    const String format = 'dd/MM/yyyy';
    return DateFormat(format).format(this);
  }
}
