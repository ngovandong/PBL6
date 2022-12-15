import 'package:get/get.dart';
import 'package:mobile/di/di.dart';
import 'package:mobile/modules/base/controllers/base_controller.export.dart';
import 'package:mobile/modules/base/data/repository/verify_auth.repository.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BaseController(), permanent: true);
    Get.put(
      VerifyAuthController(
        veriryAuthRepository: getIt.get<VeriryAuthRepository>(),
      ),
      permanent: true,
    );
  }
}
