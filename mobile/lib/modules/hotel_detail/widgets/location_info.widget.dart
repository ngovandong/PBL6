import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/info_card.widget.dart';

class LocationInfo extends GetView<HotelDetailController> {
  const LocationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
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
          Row(
            children: [
              const Icon(
                PhosphorIcons.map_pin_light,
                size: 18,
              ),
              Text(
                controller.host.fullAddress,
                style: TextStyles.s14RegularText,
              )
            ],
          ),
        ],
      ),
    );
  }
}
