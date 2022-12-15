import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

@lazySingleton
class BookingDataSource {
  Future<BookingDTO> createBooking(
    BookingDTO createBookingParams,
  ) async {
    final Map<String, dynamic> response = (await DioProvider.post(
      Endpoints.createBooking,
      body: createBookingParams.toJson(),
    ))
        .data;

    return BookingDTO.fromJson(response);
  }
}
