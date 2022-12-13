import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/info_card.widget.dart';

class DateAndTenantInfo extends GetView<HotelDetailController> {
  const DateAndTenantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        children: [
          GestureDetector(
            onTap: controller.showSelectDate,
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nhận phòng',
                        style: TextStyles.s14BoldText,
                      ),
                      Text(
                        controller
                            .hostDetailParams.value.dateCheckin.toDisplayDate,
                        style: TextStyles.s14BoldText
                            .copyWith(color: Palette.blue300),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                    child: Divider(
                      color: Palette.gray300,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Trả phòng',
                        style: TextStyles.s14BoldText,
                      ),
                      Text(
                        controller
                            .hostDetailParams.value.dateCheckout.toDisplayDate,
                        style: TextStyles.s14BoldText
                            .copyWith(color: Palette.blue300),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: controller.showSelectTenantRoom,
            behavior: HitTestBehavior.opaque,
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Số lượng phòng và khách',
                      style: TextStyles.s14BoldText,
                    ),
                    Text(
                      '1 phòng - ${controller.hostDetailParams.value.quantiyPerson} khách',
                      style: TextStyles.s14BoldText
                          .copyWith(color: Palette.blue300),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
