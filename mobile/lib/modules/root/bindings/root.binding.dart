import 'package:get/get.dart';
import 'package:mobile/modules/root/controllers/root.controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RootController());
  }
}
