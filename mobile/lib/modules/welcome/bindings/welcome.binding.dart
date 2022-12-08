import 'package:get/get.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/welcome/controllers/welcome.controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      WelcomeController(verifyAuthController: Get.find<VerifyAuthController>()),
    );
  }
}
