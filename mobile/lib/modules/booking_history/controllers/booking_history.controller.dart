import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/booking_history/data/repositories/booking_history.repository.dart';
import 'package:mobile/modules/hotel_detail/data/models/dtos/booking.dto.dart';

class BookingHistoryController extends GetxController {
  final BookingHistoryRepository bookingHistoryRepository;
  final VerifyAuthController verifyAuthController;

  BookingHistoryController({
    required this.bookingHistoryRepository,
    required this.verifyAuthController,
  });

  List<BookingDTO> currentBookings = [];
  List<BookingDTO> completedBookings = [];
  List<BookingDTO> cancelBookings = [];

  Rx<HandleStatus> getDataStatus = (HandleStatus.NORMAL).obs;

  @override
  void onInit() async {
    await _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    try {
      getDataStatus.value = HandleStatus.LOADING;

      await _getCurrentBookings();
      await _getCompletedBookings();
      await _getCancelBookings();

      getDataStatus.value = HandleStatus.HAS_DATA;
    } catch (err) {
      getDataStatus.value = HandleStatus.HAS_ERROR;
      log('Error in _getData from $runtimeType');
    }
  }

  Future<void> _getCurrentBookings() async {
    currentBookings = await bookingHistoryRepository
        .getCurrentBookings(verifyAuthController.currentUser!.id);
  }

  Future<void> _getCompletedBookings() async {
    completedBookings = await bookingHistoryRepository
        .getCompletedBookings(verifyAuthController.currentUser!.id);
  }

  Future<void> _getCancelBookings() async {
    cancelBookings = await bookingHistoryRepository
        .getCancelBookings(verifyAuthController.currentUser!.id);
  }
}
