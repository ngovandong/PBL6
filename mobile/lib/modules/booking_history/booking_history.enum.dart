abstract class BookingHistoryInternalEventEnum {
  static const String addBookingHistory = 'ADD_BOOKING_HISTORY';
  static const String refreshBookingHistory = 'REFRESH_BOOKING_HISTORY';
}

enum BookingHistoryType {
  CURRENT,
  COMPLETED,
  CANCEL,
}
