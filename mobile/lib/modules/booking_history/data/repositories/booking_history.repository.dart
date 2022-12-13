import 'package:injectable/injectable.dart';
import 'package:mobile/modules/booking_history/data/datasources/booking_history.datasource.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

@lazySingleton
class BookingHistoryRepository {
  final BookingHistoryDataSource bookingHistoryDataSource;

  BookingHistoryRepository({
    required this.bookingHistoryDataSource,
  });

  Future<List<BookingDTO>> getCurrentBookings(String userId) {
    return bookingHistoryDataSource.getCurrentBookings(userId);
  }

  Future<List<BookingDTO>> getCompletedBookings(String userId) {
    return bookingHistoryDataSource.getCompletedBookings(userId);
  }

  Future<List<BookingDTO>> getCancelBookings(String userId) {
    return bookingHistoryDataSource.getCancelBookings(userId);
  }
}
