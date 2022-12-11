import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/controllers/search_location.controller.dart';
import 'package:mobile/modules/home/data/repositories/location.repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => SearchLocationController(
        searchDestinationRepository: getIt.get<LocationRepository>(),
        homeController: Get.find<HomeController>(),
      ),
      fenix: true,
    );
  }
}
