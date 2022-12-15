import 'package:get/instance_manager.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/search_hotel/data/repositories/host.repository.dart';

class SearchHotelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SearchHotelController(
        hostRepository: getIt.get<HostRepository>(),
        homeController: Get.find<HomeController>(),
      ),
      fenix: true,
    );
  }
}
