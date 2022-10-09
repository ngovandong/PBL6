import 'package:get/get.dart';
import 'package:mobile/modules/auth/sign_up/controllers/sign_up.controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}
