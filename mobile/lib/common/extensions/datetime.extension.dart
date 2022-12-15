import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toDisplayDate => DateFormat('dd/MM/yyyy').format(this);
}
