import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';

class ChooseRoomAppBar extends GetView<ChooseRoomController> {
  final HotelDetailController hotelDetailController =
      Get.find<HotelDetailController>();

  ChooseRoomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Text(
              controller.host.name,
              style: TextStyles.s17BoldText,
            ),
            Text(
              '${hotelDetailController.hostDetailParams.value.quantiyPerson} khách, ${hotelDetailController.hostDetailParams.value.displayDate}',
              style: TextStyles.s14MediumText,
            )
          ],
        ),
      ),
      actions: [
        Obx(
          () => Visibility(
            visible: controller.rooms.where((p0) => p0.isSelected).isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(4),
                icon: Badge(
                  badgeContent: Text(
                    controller.rooms
                        .where((p0) => p0.isSelected)
                        .length
                        .toString(),
                    style: TextStyles.mediumText
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    PhosphorIcons.list_bullets,
                    color: Palette.zodiacBlue,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
      hasBackIcon: true,
      elevation: 2,
      leadingBackgroundColor: Palette.background,
      backIconColor: Palette.zodiacBlue,
    );
  }
}
