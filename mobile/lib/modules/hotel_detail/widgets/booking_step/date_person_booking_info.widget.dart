import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';

class DatePersonBookingInfo extends StatelessWidget {
  final HotelDetailController _hotelDetailController =
      Get.find<HotelDetailController>();

  DatePersonBookingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
      child: Column(
        children: [
          _DatePersonTitle(
            title: 'Ngày nhận phòng',
            value: _hotelDetailController
                .hostDetailParams.value.dateCheckin.toDisplayDate,
          ),
          const Divider(
            height: UIConfigs.horizontalPadding * 2,
          ),
          _DatePersonTitle(
            title: 'Ngày trả phòng',
            value: _hotelDetailController
                .hostDetailParams.value.dateCheckout.toDisplayDate,
          ),
          const Divider(
            height: UIConfigs.horizontalPadding * 2,
          ),
          _DatePersonTitle(
            title: 'Số lượng khách',
            value: _hotelDetailController.hostDetailParams.value.quantiyPerson
                .toString(),
          ),
        ],
      ),
    );
  }
}

class _DatePersonTitle extends StatelessWidget {
  final String title;
  final String value;

  const _DatePersonTitle({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.s17BoldText,
          ),
          Text(
            value,
            style: TextStyles.mediumText.copyWith(
              fontSize: 16,
              color: Palette.gray300,
            ),
          )
        ],
      ),
    );
  }
}
