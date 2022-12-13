import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/info_card.widget.dart';

class AccommodationsInfo extends GetView<HotelDetailController> {
  const AccommodationsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RouteManager.chooseRoom,
          arguments: controller.host,
        );
      },
      child: InfoCard(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Giá cho ${controller.hostDetailParams.value.numberOfDate} đêm ',
                        style: TextStyles.s17BoldText,
                      ),
                      TextSpan(
                        text:
                            '(${controller.hostDetailParams.value.displayDate})',
                        style: TextStyles.s14MediumText
                            .copyWith(color: Palette.gray400),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  controller.host.cheapestRoom.totalPrice.toMoneyFormat,
                  style: TextStyles.s14BoldText.copyWith(color: Palette.red400),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right_rounded,
              color: Palette.zodiacBlue,
            )
          ],
        ),
      ),
    );
  }
}
