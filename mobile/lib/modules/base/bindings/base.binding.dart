import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/base/controllers/socket.controller.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/base/data/repository/verify_auth.repository.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/favorite_host/data/repository/favorite_host.repository.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(BaseController(), permanent: true);
    Get.put(
      VerifyAuthController(
        veriryAuthRepository: getIt.get<VeriryAuthRepository>(),
      ),
      permanent: true,
    );
    Get.put(
      FavoriteLookupController(
        favoriteHostRepository: getIt.get<FavoriteHostRepository>(),
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
      permanent: true,
    );
    Get.put(
      SocketController(
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
      permanent: true,
    );
  }
}
