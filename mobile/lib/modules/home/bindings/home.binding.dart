import 'package:get/get.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/controllers/pick_destination.controller.dart';
import 'package:mobile/modules/home/controllers/search_hotel.controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => PickDestinationController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SearchHotelController(),
      fenix: true,
    );
  }
}
