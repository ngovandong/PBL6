import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';

class LocationFrame extends GetView<HomeController> {
  const LocationFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteManager.searchLocation),
      child: AppTextFormField(
        textController: controller.locationTextController,
        hintText: LocaleKeys.find_hotel_choose_destination.tr,
        prefixIcon: const Icon(
          PhosphorIcons.magnifying_glass_bold,
          color: Palette.blue400,
        ),
        borderColor: Colors.white,
        borderRadius: 0,
        extendField: false,
        readOnly: true,
        enabled: false,
      ),
    );
  }
}
