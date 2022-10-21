import 'package:get/get.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/controllers/pick_destination.controller.dart';
import 'package:mobile/modules/home/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/home/data/repositories/user.repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(userRepository: getIt.get<UserRepository>()),
    );
    Get.lazyPut(
      () => PickDestinationController(),
    );
    Get.lazyPut(
      () => SearchHotelController(),
      fenix: true,
    );
  }
}
