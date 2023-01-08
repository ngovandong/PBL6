import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/booking_history/data/repositories/booking_history.repository.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/booking_step.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/confirm_booking.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/fill_profile_info.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';

class HotelDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HotelDetailController(
        hostRepository: getIt.get<HostRepository>(),
        homeController: Get.find<HomeController>(),
        favoriteLookupController: Get.find<FavoriteLookupController>(),
      ),
    );
    Get.lazyPut(
      () => ChooseRoomController(
        hotelDetailController: Get.find<HotelDetailController>(),
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
    );
    Get.lazyPut(
      () => FillProfileInfoController(
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
    );
    Get.lazyPut(
      () => BookingStepController(
        bookingRepository: getIt.get<BookingHistoryRepository>(),
        fillProfileInfoController: Get.find<FillProfileInfoController>(),
        hotelDetailController: Get.find<HotelDetailController>(),
        chooseRoomController: Get.find<ChooseRoomController>(),
      ),
    );
    Get.lazyPut(
      () => ConfirmBookingController(
        bookingHistoryRepository: getIt.get<BookingHistoryRepository>(),
      ),
    );
  }
}
