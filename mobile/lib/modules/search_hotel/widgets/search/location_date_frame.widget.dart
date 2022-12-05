import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';

class LocationDateFrame extends GetView<SearchHotelController> {
  final HomeController _homeController = Get.find<HomeController>();

  LocationDateFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.onTapSearchBox,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              behavior: HitTestBehavior.opaque,
              child: const SizedBox.square(
                dimension: 70,
                child: Center(
                  child: Icon(
                    PhosphorIcons.caret_left_bold,
                    color: Palette.blue400,
                    size: 28,
                  ),
                ),
              ),
            ),
            Obx(
              () {
                final SearchHotelsDTO searchHotelsDTO =
                    _homeController.searchHotelsParams.value;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchHotelsDTO.searchText,
                      style: TextStyles.s17BoldText,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          '${searchHotelsDTO.checkinDate.toDisplayDate} - ${searchHotelsDTO.checkoutDate.toDisplayDate}',
                          style:
                              TextStyles.regularText.copyWith(fontSize: 13.sp),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.zodiacBlue,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '${searchHotelsDTO.quantityPerson} khách',
                          style:
                              TextStyles.regularText.copyWith(fontSize: 13.sp),
                        )
                      ],
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
