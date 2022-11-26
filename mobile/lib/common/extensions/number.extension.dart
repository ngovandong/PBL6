import 'package:intl/intl.dart';

extension NumberExtension on num {
  String get toMoneyFormat => NumberFormat.currency(
        name: '',
        decimalDigits: 0,
        symbol: 'đ',
        customPattern: '#,###.#\u00a4',
      ).format(this);
}
