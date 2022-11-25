import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/auth/controllers/auth.controller.dart';
import 'package:mobile/modules/auth/controllers/fill_email.controller.dart';
import 'package:mobile/modules/auth/data/repositories/auth.repository.dart';
import 'package:mobile/modules/base/controllers/base_controller.export.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthController(
        authRepository: getIt.get<AuthRepository>(),
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
    );
    Get.lazyPut(
      () => FillEmailController(
        authRepository: getIt.get<AuthRepository>(),
        verifyAuthController: Get.find<VerifyAuthController>(),
      ),
      fenix: true,
    );
  }
}
