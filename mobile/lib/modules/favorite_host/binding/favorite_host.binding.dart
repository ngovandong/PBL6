import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/favorite_host/data/repository/favorite_host.repository.dart';

class FavoriteHostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavoriteLookupController(
        favoriteHostRepository: getIt.get<FavoriteHostRepository>(),
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
    );
  }
}
