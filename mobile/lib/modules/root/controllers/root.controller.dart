import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt currentTabIndex = 0.obs;

  void changeTabIndex(int newIndex) {
    currentTabIndex.value = newIndex;
  }
}
