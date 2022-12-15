import 'package:injectable/injectable.dart';
import 'package:mobile/modules/hotel_detail/data/datasources/booking.datasource.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

@lazySingleton
class BookingRepository {
  final BookingDataSource bookingDataSource;

  BookingRepository({
    required this.bookingDataSource,
  });

  Future<BookingDTO> createBooking(BookingDTO createBookingParams) {
    return bookingDataSource.createBooking(createBookingParams);
  }
}
