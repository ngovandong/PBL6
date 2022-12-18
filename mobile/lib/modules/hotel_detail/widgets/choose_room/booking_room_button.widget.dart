import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';

class BookingRoomButton extends GetView<ChooseRoomController> {
  const BookingRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Visibility(
          visible: controller.rooms.where((p0) => p0.isSelected).isNotEmpty,
          child: Container(
            color: Palette.scaffoldBackgroundColor,
            padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
            child: SafeArea(
              top: false,
              child: AppRoundedButton(
                onPressed: controller.bookingRoom,
                content:
                    'Đặt phòng - ${controller.totalMoneny.value.toMoneyFormat}',
                fontSize: 15,
                showShadow: false,
                backgroundColor: Palette.blue400,
              ),
            ),
          ),
        );
      },
    );
  }
}
