import 'package:get/get.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/modules/base/data/repositories/auth.repository.dart';
import 'package:mobile/modules/login/controllers/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(authRepository: getIt.get<AuthRepository>()),
    );
  }
}
