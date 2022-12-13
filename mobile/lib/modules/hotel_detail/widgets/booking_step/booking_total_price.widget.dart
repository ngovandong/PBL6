import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';

class BookingTotalPrice extends StatelessWidget {
  final ChooseRoomController _chooseRoomController =
      Get.find<ChooseRoomController>();

  BookingTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Tổng cộng',
            style: TextStyles.s17BoldText,
          ),
          Text(
            _chooseRoomController.totalMoneny.value.toMoneyFormat,
            style: TextStyles.s17BoldText.copyWith(color: Palette.red500),
          )
        ],
      ),
    );
  }
}
