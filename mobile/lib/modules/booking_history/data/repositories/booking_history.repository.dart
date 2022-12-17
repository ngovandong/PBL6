import 'package:injectable/injectable.dart';
import 'package:mobile/modules/booking_history/data/datasources/booking_history.datasource.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';

@lazySingleton
class BookingHistoryRepository {
  final BookingHistoryDataSource bookingHistoryDataSource;

  BookingHistoryRepository({
    required this.bookingHistoryDataSource,
  });

  Future<BookingDTO> createBooking(BookingDTO createBookingParams) {
    return bookingHistoryDataSource.createBooking(createBookingParams);
  }

  Future<List<BookingDTO>> getCurrentBookings(String userId) {
    return bookingHistoryDataSource.getCurrentBookings(userId);
  }

  Future<List<BookingDTO>> getCompletedBookings(String userId) {
    return bookingHistoryDataSource.getCompletedBookings(userId);
  }

  Future<List<BookingDTO>> getCancelBookings(String userId) {
    return bookingHistoryDataSource.getCancelBookings(userId);
  }

  Future<void> cancelBooking(String bookingId) async {
    return bookingHistoryDataSource.cancelBooking(bookingId);
  }
}
