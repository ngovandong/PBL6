import 'package:get/get.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';
import 'package:mobile/modules/welcome/controllers/welcome.controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      WelcomeController(authController: Get.find<AuthController>()),
    );
  }
}
