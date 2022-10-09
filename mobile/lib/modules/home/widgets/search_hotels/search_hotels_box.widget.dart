import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/generated/assets.gen.dart';

class SearchHotelsBox extends StatelessWidget {
  const SearchHotelsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: MediaQuery.of(context).padding.top + 120,
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Assets.images.background.wave.svg(
              width: Get.width,
              height: 120.h,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 12,
            top: MediaQuery.of(context).padding.top,
            child: AppIconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                PhosphorIcons.caret_left_bold,
                color: Palette.blue400,
              ),
              width: 40,
              height: 40,
              borderColor: Palette.blue400,
              isCircle: true,
            ),
          ),
          Positioned(
            left: 12,
            top: MediaQuery.of(context).padding.top + 50,
            child: Container(
              width: Get.width - 20,
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
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        const SizedBox.square(
                          dimension: 70,
                          child: Center(
                            child: Icon(
                              PhosphorIcons.magnifying_glass_bold,
                              color: Palette.blue400,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hội An, Quảng Nam',
                              style: TextStyles.s17BoldText,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Text(
                                  '10/10/2022 - 12/10/2022',
                                  style: TextStyles.regularText
                                      .copyWith(fontSize: 13.sp),
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
                                  '2 khách',
                                  style: TextStyles.regularText
                                      .copyWith(fontSize: 13.sp),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
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
                              style: TextStyles.s14MediumText
                                  .copyWith(color: Palette.blue400),
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          width: 0,
                        ),
                        Row(
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
                              style: TextStyles.s14MediumText
                                  .copyWith(color: Palette.blue400),
                            ),
                          ],
                        )
                      ],
                    ),
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