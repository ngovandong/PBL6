import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';

class WelcomeController extends GetxController {
  final VerifyAuthController verifyAuthController;

  WelcomeController({
    required this.verifyAuthController,
  });

  @override
  Future<void> onInit() async {
    await initSplash();
    super.onInit();
  }

  Future<void> initSplash() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await verifyAuthController.verifyUserAuth();
    Get.offAllNamed(RouteManager.root);
  }
}
