import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_host.controller.dart';
import 'package:mobile/modules/favorite_host/data/repository/favorite_host.repository.dart';

class FavoriteHostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavoriteHostController(
        favoriteHostRepository: getIt.get<FavoriteHostRepository>(),
      ),
    );
  }
}
