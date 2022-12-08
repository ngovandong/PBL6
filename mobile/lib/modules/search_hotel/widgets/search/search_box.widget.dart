import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/modules/search_hotel/widgets/search/filter_sort_frame.widget.dart';
import 'package:mobile/modules/search_hotel/widgets/search/location_date_frame.widget.dart';

class SearchHotelsBox extends StatelessWidget {
  const SearchHotelsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: MediaQuery.of(context).padding.top + 120,
      color: Palette.background,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Assets.images.background.wave.svg(
              width: Get.width,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 12,
            top: MediaQuery.of(context).padding.top,
            child: Container(
              width: Get.width - 24,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  LocationDateFrame(),
                  const Divider(
                    height: 0,
                  ),
                  const Expanded(
                    child: FilterSortFrame(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
