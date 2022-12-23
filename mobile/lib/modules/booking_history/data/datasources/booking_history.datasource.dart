import 'package:injectable/injectable.dart';
import 'package:mobile/common/constants/endpoints.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';
import 'package:mobile/modules/booking_history/booking_history.enum.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';

@lazySingleton
class BookingHistoryDataSource {
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

  Future<List<BookingDTO>> getPendingBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.pendingBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e)..type = BookingHistoryType.PENDING)
        .toList();

    return result;
  }

  Future<List<BookingDTO>> getCurrentBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getCurrentBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e)..type = BookingHistoryType.CURRENT)
        .toList();

    return result;
  }

  Future<List<BookingDTO>> getCompletedBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getCompletedBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e)..type = BookingHistoryType.COMPLETED)
        .toList();

    return result;
  }

  Future<List<BookingDTO>> getCancelBookings(String userId) async {
    final HttpRequestResponse response =
        await DioProvider.get('${Endpoints.getCancelBooking}/$userId');

    final List<BookingDTO> result = (response.data as List<dynamic>)
        .map((e) => BookingDTO.fromJson(e)..type = BookingHistoryType.CANCEL)
        .toList();

    return result;
  }

  Future<void> cancelBooking(String bookingId) async {
    await DioProvider.post('${Endpoints.getCancelBooking}/$bookingId');
  }
}
