import 'package:get/get.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';

class WelcomeController extends GetxController {
  final AuthController authController;

  WelcomeController({required this.authController});

  @override
  Future<void> onInit() async {
    await initSplash();
    super.onInit();
  }

  Future<void> initSplash() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await authController.verifyUser();
  }
}
