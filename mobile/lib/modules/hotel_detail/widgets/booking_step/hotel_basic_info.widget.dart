import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/icon_title.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';

class HotelBasicInfo extends StatelessWidget {
  final HotelDetailController _hotelDetailController =
      Get.find<HotelDetailController>();

  HotelBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 240,
      width: Get.width,
      padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              _hotelDetailController.host.avatarImage,
              height: 240 - 2 * UIConfigs.horizontalPadding,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: UIConfigs.horizontalPadding,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _hotelDetailController.host.name,
                  style: TextStyles.boldText.copyWith(fontSize: 18),
                ),
                Row(
                  children: List.generate(
                    4,
                    (index) => const Icon(
                      PhosphorIcons.star_fill,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                IconTitle(
                  icon: PhosphorIcons.map_pin_light,
                  title: _hotelDetailController.host.fullAddress,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
