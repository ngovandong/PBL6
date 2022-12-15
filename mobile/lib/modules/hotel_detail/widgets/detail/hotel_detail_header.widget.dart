import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/image_slider.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';

class HotelDetailHeader extends GetView<HotelDetailController> {
  const HotelDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width - UIConfigs.horizontalPadding * 2,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: ImageSlider(
              width: Get.width - UIConfigs.horizontalPadding * 2,
              height: 200,
              images: controller.host.images,
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
    );
  }
}
