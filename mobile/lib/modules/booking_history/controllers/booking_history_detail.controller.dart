import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobile/common/utils/dialog.util.dart';
import 'package:mobile/common/utils/snackbar.util.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';
import 'package:mobile/modules/booking_history/data/models/booking.dto.dart';
import 'package:mobile/modules/booking_history/data/repositories/booking_history.repository.dart';

class BookingHistoryDetailController extends GetxController {
  final BookingDTO bookingParams = Get.arguments;
  final BookingHistoryRepository bookingHistoryRepository;
  final BookingHistoryController bookingHistoryController;

  BookingHistoryDetailController({
    required this.bookingHistoryRepository,
    required this.bookingHistoryController,
  });

  Future<void> cancelBooking() async {
    try {
      DialogUtil.showLoading(content: 'Đang huỷ đặt phòng');

      await bookingHistoryRepository.cancelBooking(bookingParams.id!);

      bookingHistoryController.cancelBookings.add(bookingParams);
      bookingHistoryController.currentBookings
          .removeWhere((element) => element.id! == bookingParams.id!);

      DialogUtil.hideLoading();
      Get.back();
    } catch (err) {
      DialogUtil.hideLoading();
      log('Error in cancelBooking: $err');
      SnackbarUtil.showError();
    }
  }
}
