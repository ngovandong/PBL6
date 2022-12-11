import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/extensions/number.extension.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/modules/hotel_detail/controllers/choose_room.controller.dart';
import 'package:mobile/modules/search_hotel/data/models/accommodation.model.dart';

class ChooseRoomView extends GetView<ChooseRoomController> {
  const ChooseRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: GestureDetector(
          onTap: () {},
          child: Column(
            children: const [
              Text(
                'Coco hotel',
                style: TextStyles.s17BoldText,
              ),
              Text(
                '2 khách, 23/10/2022 - 24/10/2022',
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
              itemCount: controller.rooms.length,
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  height: 10,
                );
              }),
              itemBuilder: (context, index) {
                final AccommodationModel currentRoom = controller.rooms[index];

                return Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Palette.gray100),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: PageView.builder(
                          itemCount: currentRoom.images.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                currentRoom.images[index],
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentRoom.name,
                                  style: TextStyles.s17BoldText,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6.0),
                                  child: SizedBox(
                                    height: 20,
                                    child: Row(
                                      children: const [
                                        Text(
                                          '17 m\u00B2',
                                          style: TextStyles.s14MediumText,
                                        ),
                                        VerticalDivider(
                                          width: 12,
                                          color: Palette.gray300,
                                        ),
                                        Text(
                                          'Tối đa 2 người lớn',
                                          style: TextStyles.s14MediumText,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Text(
                                  '1 giường đôi lớn',
                                  style: TextStyles.s14MediumText,
                                ),
                              ],
                            ),
                            Text(
                              currentRoom.price.toMoneyFormat,
                              style: TextStyles.boldText.copyWith(
                                color: Palette.red400,
                                fontSize: 18.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.check,
                                color: Palette.green400,
                                size: 18,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: 'View nhìn ra biển',
                              style: TextStyles.s14RegularText,
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.check,
                                color: Palette.green400,
                                size: 18,
                              ),
                            ),
                            WidgetSpan(
                              child: SizedBox(
                                width: 4,
                              ),
                            ),
                            TextSpan(
                              text: 'View nhìn ra biển',
                              style: TextStyles.s14RegularText,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GetBuilder<ChooseRoomController>(
                        id: currentRoom.id,
                        builder: (_) {
                          return AppRoundedButton(
                            width: Get.width -
                                UIConfigs.horizontalPadding * 2 -
                                10 * 2,
                            height: 45,
                            onPressed: () {
                              controller.addRoom(currentRoom.id);
                            },
                            content: currentRoom.isSelected == false
                                ? 'Chọn'
                                : '${currentRoom.bookingQuantity} phòng',
                            suffixIcon: currentRoom.isSelected == false
                                ? null
                                : const Icon(
                                    PhosphorIcons.caret_down,
                                    color: Colors.white,
                                  ),
                            showShadow: false,
                            fontSize: 14,
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.rooms.where((p0) => p0.isSelected).isNotEmpty,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
                child: SafeArea(
                  top: false,
                  child: AppRoundedButton(
                    onPressed: () {
                      Get.toNamed(RouteManager.bookingStep);
                    },
                    content:
                        'Đặt phòng - ${controller.totalMoneny.value.toMoneyFormat}',
                    fontSize: 15,
                    showShadow: false,
                    backgroundColor: Palette.blue400,
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}

// 