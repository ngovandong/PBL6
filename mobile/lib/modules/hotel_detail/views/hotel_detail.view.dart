import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/handle_status.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/modules/favorite_host/controller/favorite_lookup.controller.dart';
import 'package:mobile/modules/hotel_detail/controllers/hotel_detail.controller.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/bottom_button.widget.dart';
import 'package:mobile/modules/hotel_detail/widgets/detail/hotel_detail_body.widget.dart';

class HotelDetailScreen extends GetView<HotelDetailController> {
  final FavoriteLookupController _favoriteLookupController =
      Get.find<FavoriteLookupController>();

  HotelDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: controller.getDataStatus.value == HandleStatus.HAS_DATA
            ? CustomAppBar(
                hasBackIcon: true,
                title: Text(
                  controller.host.name,
                  style: TextStyles.s14BoldText.copyWith(color: Colors.white),
                ),
                backgroundColor: Palette.blue400,
                onLeadingAction: () {
                  Get.back();
                },
                actions: [
                  GetBuilder<HotelDetailController>(
                    id: controller.host.id,
                    builder: (_) {
                      return AppIconButton(
                        onPressed: () async {
                          if (controller.host.isFavorite) {
                            await _favoriteLookupController
                                .deleteFavoriteHost(controller.host.id);
                          } else {
                            await _favoriteLookupController
                                .addFavoriteHost(controller.host);
                          }
                        },
                        width: 40,
                        height: 40,
                        hasBorder: false,
                        backgroundColor: Palette.blue400,
                        icon: Icon(
                          controller.host.isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          size: 28,
                          color: controller.host.isFavorite
                              ? Palette.red500
                              : Colors.white,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
            : null,
        body: const HotelDetailBody(),
        bottomNavigationBar: const BottomButton(),
      ),
    );
  }
}
