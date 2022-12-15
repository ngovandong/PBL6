import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

@lazySingleton
class BookingHistoryDataSource {
  Future<List<BookingDTO>> getCurrentBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getCurrentBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e))
        .toList();

    return result;
  }

  Future<List<BookingDTO>> getCompletedBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getCompletedBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e))
        .toList();

    return result;
  }

  Future<List<BookingDTO>> getCancelBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getCancelBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e))
        .toList();

    return result;
  }
}
