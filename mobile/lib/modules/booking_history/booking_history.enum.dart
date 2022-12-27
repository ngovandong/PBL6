abstract class BookingHistoryInternalEventEnum {
  static const String addBookingHistory = 'ADD_BOOKING_HISTORY';
  static const String refreshBookingHistory = 'REFRESH_BOOKING_HISTORY';
  static const String paymentSuccess = 'PAYMENT_SUCCESS';
  static const String cancelBooking = 'CANCEL_BOOKING';
}

enum BookingHistoryType {
  PENDING,
  CURRENT,
  COMPLETED,
  CANCEL,
}
