import 'package:get/get.dart';
import 'package:mobile/modules/base/controllers/socket.controller.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/welcome/controllers/welcome.controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      WelcomeController(
        verifyAuthController: Get.find<VerifyAuthController>(),
        favoriteLookupController: Get.find<FavoriteLookupController>(),
        socketController: Get.find<SocketController>(),
      ),
    );
  }
}
