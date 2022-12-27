import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/modules/base/controllers/socket.controller.dart';
import 'package:mobile/modules/base/controllers/verify_auth.controller.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';

class WelcomeController extends GetxController {
  final VerifyAuthController verifyAuthController;
  final FavoriteLookupController favoriteLookupController;
  final SocketController socketController;

  WelcomeController({
    required this.verifyAuthController,
    required this.favoriteLookupController,
    required this.socketController,
  });

  @override
  Future<void> onInit() async {
    await initSplash();
    super.onInit();
  }

  Future<void> initSplash() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await verifyAuthController.verifyUserAuth();
    socketController.connectToHub();
    favoriteLookupController.getFavoriteHosts();
    Get.offAllNamed(RouteManager.root);
  }
}
