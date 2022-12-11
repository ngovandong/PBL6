import 'package:get/get.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';

class BookingHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BookingHistoryController(),
    );
  }
}
