import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/modules/home/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/home/widgets/home/home_search_box.widget.dart';
import 'package:mobile/modules/home/widgets/search_hotels/list_searched_hotels.widget.dart';
import 'package:mobile/modules/home/widgets/search_hotels/search_hotels_box.widget.dart';

class SearchHotelScreen extends GetView<SearchHotelController> {
  const SearchHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: const [
                  SearchHotelsBox(),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: ListSearchedHotels(),
                  )
                ],
              ),
            ),
          ),
          Obx(() {
            if (controller.showSearchBox.value) {
              return Positioned(
                left: 0,
                top: 0,
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
              );
            }
            return const Positioned(
              left: 0,
              top: 0,
              child: SizedBox(),
            );
          })
        ],
      ),
      backgroundColor: Palette.background,
    );
  }
}
