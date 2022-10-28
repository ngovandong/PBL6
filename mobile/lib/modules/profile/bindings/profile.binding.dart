import 'package:get/get.dart';
import 'package:mobile/modules/profile/controllers/profile.controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(),
    );
  }
}
