import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/widgets/search_empty.widget.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/search_hotel/widgets/searched_hotels/searched_hotel_item.widget.dart';

class ListSearchedHotels extends GetView<SearchHotelController> {
  const ListSearchedHotels({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.searchedHosts.isEmpty) {
      return SearchEmpty(
        width: Get.width * 0.8,
        content: 'Không tìm thấy chỗ ở phù hợp',
      );
    } else {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: controller.searchedHosts.length,
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        separatorBuilder: ((context, index) {
          return const SizedBox(
            height: 10,
          );
        }),
        itemBuilder: (context, index) {
          return GetBuilder<SearchHotelController>(
            id: controller.searchedHosts[index].id,
            builder: (_) {
              return SearchedHotelItem(
                host: controller.searchedHosts[index],
              );
            },
          );
        },
      );
    }
  }
}
