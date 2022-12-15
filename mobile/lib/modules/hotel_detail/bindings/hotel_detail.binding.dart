import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';

class HotelDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HotelDetailController(
        hostRepository: getIt.get<HostRepository>(),
        homeController: Get.find<HomeController>(),
      ),
    );
    Get.lazyPut(
      () => ChooseRoomController(
        hotelDetailController: Get.find<HotelDetailController>(),
      ),
      fenix: true,
    );
  }
}
