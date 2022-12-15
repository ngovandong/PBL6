import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history.controller.dart';
import 'package:mobile/modules/booking_history/controllers/booking_history_detail.controller.dart';
import 'package:mobile/modules/booking_history/data/repositories/booking_history.repository.dart';

class BookingHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BookingHistoryController(
        bookingHistoryRepository: getIt.get<BookingHistoryRepository>(),
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
    );
    Get.lazyPut(
      () => BookingHistoryDetailController(),
    );
  }
}
