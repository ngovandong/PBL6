import 'package:get/get.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/auth/login/controllers/login.controller.dart';
import 'package:mobile/modules/base/data/repositories/auth.repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(authRepository: getIt.get<AuthRepository>()),
    );
  }
}
