import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/base/controllers/socket.controller.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/profile/controllers/profile.controller.dart';
import 'package:mobile/modules/profile/controllers/user_setting.controller.dart';
import 'package:mobile/modules/profile/data/repositories/profile.repository.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        verifyAuthController: Get.find<VerifyAuthController>(),
        socketController: Get.find<SocketController>(),
      ),
    );
    Get.lazyPut(
      () => UserSettingController(
        verifyAuthController: Get.find<VerifyAuthController>(),
        profileRepository: getIt.get<ProfileRepository>(),
      ),
    );
  }
}
