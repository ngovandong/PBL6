import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';

class BottomButton extends GetView<HotelDetailController> {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.getDataStatus.value == HandleStatus.HAS_DATA,
        child: Container(
          height: 70,
          color: Colors.white,
          child: Center(
            child: AppRoundedButton(
              width: Get.width - UIConfigs.horizontalPadding * 2,
              onPressed: () {
                Get.toNamed(
                  RouteManager.chooseRoom,
                  arguments: controller.host,
                );
              },
              content: 'Chọn phòng',
              borderRadius: 0,
              showShadow: false,
            ),
          ),
        ),
      ),
    );
  }
}
