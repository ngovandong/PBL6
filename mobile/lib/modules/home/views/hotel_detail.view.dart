import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/generated/locales.g.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: UIConfigs.horizontalPadding,
          right: UIConfigs.horizontalPadding,
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          children: [
            SizedBox(
              width: Get.width - UIConfigs.horizontalPadding * 2,
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: Get.width - UIConfigs.horizontalPadding * 2,
                      height: 200,
                      child: PageView.builder(
                        itemCount: 4,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://phuot3mien.com/wp-content/uploads/2020/03/cau-rong-da-nang-phuot3mien.jpg',
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: AppIconButton(
                      onPressed: Get.back,
                      icon: const Icon(
                        Icons.chevron_left_rounded,
                        size: 28,
                        color: Colors.white,
                      ),
                      isCircle: true,
                      width: 35,
                      height: 35,
                      hasBorder: false,
                      backgroundColor: Colors.black.withOpacity(0.4),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: UIConfigs.horizontalPadding,
                bottom: UIConfigs.horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Coco Hotel',
                    style: TextStyles.boldText.copyWith(fontSize: 22),
                  ),
                  Container(
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Palette.blue300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '4.9',
                              style: TextStyles.s17BoldText,
                            ),
                            Icon(
                              PhosphorIcons.star_fill,
                              size: 17,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                        const Text(
                          '1,121 đánh giá',
                          style: TextStyles.s14MediumText,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: Get.width - UIConfigs.horizontalPadding * 2,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.hotel_detail_position.tr,
                    style: TextStyles.s17BoldText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.red,
                    margin: const EdgeInsets.only(bottom: 5),
                  ),
                  Row(
                    children: const [
                      Icon(
                        PhosphorIcons.map_pin_light,
                        size: 18,
                      ),
                      Text(
                        'Hội An, Quảng Nam',
                        style: TextStyles.s14RegularText,
                      )
                    ],
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                    child: Divider(
                      thickness: 1.2,
                      height: 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Những tiện ích',
                        style: TextStyles.s17BoldText,
                      ),
                      Text(
                        'xem tất cả',
                        style: TextStyles.s14RegularText.copyWith(
                          color: Palette.blue300,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Chính sách',
                        style: TextStyles.s17BoldText,
                      ),
                      Text(
                        'xem tất cả',
                        style: TextStyles.s14RegularText.copyWith(
                          color: Palette.blue300,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Xếp hạng và nhận xét',
                        style: TextStyles.s17BoldText,
                      ),
                      Text(
                        'xem tất cả',
                        style: TextStyles.s14RegularText.copyWith(
                          color: Palette.blue300,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Center(
          child: AppRoundedButton(
            width: Get.width - UIConfigs.horizontalPadding * 2,
            onPressed: () {
              Get.toNamed(RouteManager.chooseRoom);
            },
            content: 'Chọn phòng',
            borderRadius: 0,
            showShadow: false,
          ),
        ),
      ),
    );
  }
}
