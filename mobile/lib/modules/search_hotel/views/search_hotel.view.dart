import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/index.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/search_hotel/widgets/search/floating_search_box.widget.dart';
import 'package:mobile/modules/search_hotel/widgets/searched_hotels/list_searched_hotels.widget.dart';
import 'package:mobile/modules/search_hotel/widgets/search/search_box.widget.dart';

class SearchHotelView extends GetView<SearchHotelController> {
  const SearchHotelView({super.key});

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
                children: [
                  const SearchHotelsBox(),
                  Expanded(
                    child: Obx(
                      () {
                        final HandleStatus getDataStatus =
                            controller.getDataStatus.value;

                        if (getDataStatus == HandleStatus.LOADING) {
                          return const Center(
                            child: LoadingDot(
                              dotColor: Palette.blue400,
                            ),
                          );
                        } else if (getDataStatus == HandleStatus.HAS_DATA) {
                          return const ListSearchedHotels();
                        } else if (getDataStatus == HandleStatus.HAS_ERROR) {
                          return Center(
                            child: Text(
                              LocaleKeys.share_error_message.tr,
                              style: TextStyles.s17MediumText
                                  .copyWith(color: Palette.red500),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const FloatingSearchBox(),
        ],
      ),
      backgroundColor: Palette.background,
    );
  }
}
