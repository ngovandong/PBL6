import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bottom_sheet.util.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/search_hotel/controllers/search_hotel.controller.dart';
import 'package:mobile/modules/search_hotel/widgets/search/filter_options_sheet.widget.dart';
import 'package:mobile/modules/search_hotel/widgets/search/sort_options_sheet.widget.dart';

class FilterSortFrame extends GetView<SearchHotelController> {
  final HomeController _homeController = Get.find<HomeController>();

  FilterSortFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              BottomSheetUtil.show(
                child: FilterOptionsSheet(
                  key: controller.filterOptionKey,
                  selectedStar:
                      _homeController.searchHotelsParams.value.ratingStar ?? -1,
                  selectedUtilities:
                      _homeController.searchHotelsParams.value.utilities ?? [],
                ),
                isSubmit: true,
                title: 'Lọc danh sách khách sạn',
                height: Get.height * 0.95,
                submitAction: controller.submitFilter,
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  PhosphorIcons.sliders_horizontal_light,
                  color: Palette.blue400,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Bộ lọc',
                  style:
                      TextStyles.s14MediumText.copyWith(color: Palette.blue400),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          width: 0,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              BottomSheetUtil.show(
                child: const SortOptionsSheet(),
              );
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  PhosphorIcons.funnel_light,
                  color: Palette.blue400,
                  size: 20,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Sắp xếp',
                  style:
                      TextStyles.s14MediumText.copyWith(color: Palette.blue400),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
