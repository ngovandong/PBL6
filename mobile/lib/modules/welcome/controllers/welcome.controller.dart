import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';

class WelcomeController extends GetxController {
  @override
  Future<void> onInit() async {
    await initSplash();
    super.onInit();
  }

  Future<void> initSplash() async {
    await Future.delayed(const Duration(milliseconds: 700));
    Get.offAllNamed(RouteManager.root);
  }
}
