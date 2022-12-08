import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/home/widgets/search_box/search_box.widget.dart';

class FloatingSearchBox extends GetView<SearchHotelController> {
  const FloatingSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Positioned(
        left: 0,
        top: 0,
        child: Visibility(
          visible: controller.showSearchBox.value,
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Container(
                  height: 280,
                  width: Get.width,
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Column(
                    children: const [
                      HomeSearchBox(),
                    ],
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: controller.onTapSearchBox,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
