import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/widgets/search_box/date_frame.widget.dart';
import 'package:mobile/modules/home/widgets/search_box/location_frame.widget.dart';
import 'package:mobile/modules/home/widgets/search_box/tenant_room_frame.widget.dart';

class HomeSearchBox extends GetView<HomeController> {
  const HomeSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Palette.blue400),
      ),
      margin: const EdgeInsets.fromLTRB(
        UIConfigs.horizontalPadding,
        UIConfigs.horizontalPadding,
        UIConfigs.horizontalPadding,
        0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            const LocationFrame(),
            const Divider(
              height: 0,
              thickness: 0.6,
            ),
            const DateFrame(),
            const Divider(
              height: 0,
              thickness: 0.6,
            ),
            const TenantRoomFrame(),
            AppRoundedButton(
              onPressed: controller.findHotels,
              content: 'Tìm',
              showShadow: false,
              height: 48,
              borderRadius: 0,
              backgroundColor: Palette.blue400,
            )
          ],
        ),
      ),
    );
  }
}
