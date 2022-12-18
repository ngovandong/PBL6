import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
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
          color: Palette.scaffoldBackgroundColor,
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
          child: SafeArea(
            top: false,
            child: AppRoundedButton(
              onPressed: () {
                Get.toNamed(
                  RouteManager.chooseRoom,
                  arguments: controller.host,
                );
              },
              content: 'Chọn phòng',
              showShadow: false,
              fontSize: 15,
              backgroundColor: Palette.blue400,
            ),
          ),
        ),
      ),
    );
  }
}
