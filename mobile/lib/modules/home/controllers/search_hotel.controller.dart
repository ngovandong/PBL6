import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHotelController extends GetxController {
  RxBool showSearchBox = false.obs;

  void onTapSearchBox() {
    log('onTapSearchBox');
    showSearchBox.toggle();
  }

  void onTapFilter() {
    Get.bottomSheet(
      Container(),
    );
  }
}
