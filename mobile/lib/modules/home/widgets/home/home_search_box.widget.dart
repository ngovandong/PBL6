import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_date_picker.widget.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/pick_number_tenant_room.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/data/dtos/search_hotels.dto.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeSearchBox extends GetView<HomeController> {
  const HomeSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Palette.blue400),
      ),
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Wrap(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(RouteManager.pickDestination),
              child: AppTextFormField(
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
            ),
            const Divider(
              height: 0,
              thickness: 0.6,
            ),
            GestureDetector(
              onTap: () async {
                await showBarModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  builder: (context) {
                    final SearchHotelsDTO searchHotelsParams =
                        controller.searchHotelsParams.value;

                    return AppDatePicker(
                      initStartDate: searchHotelsParams.checkinDate,
                      initEndDate: searchHotelsParams.checkinDate,
                      onSubmitRange: controller.onChangeCheckinCheckoutDate,
                    );
                  },
                );
              },
              child: Container(
                height: 48,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    const SizedBox.square(
                      dimension: 48,
                      child: Center(
                        child: Icon(
                          PhosphorIcons.calendar_blank_bold,
                          color: Palette.blue400,
                        ),
                      ),
                    ),
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ngày nhận phòng\n',
                              style: TextStyles.s14regularText
                                  .copyWith(color: Palette.gray100),
                            ),
                            TextSpan(
                              text: controller
                                  .searchHotelsParams.value.checkinDate
                                  .toShowUIDate(),
                              style: TextStyles.s14regularText,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ngày trả phòng\n',
                              style: TextStyles.s14regularText
                                  .copyWith(color: Palette.gray100),
                            ),
                            TextSpan(
                              text: controller
                                  .searchHotelsParams.value.checkoutDate
                                  .toShowUIDate(),
                              style: TextStyles.s14regularText,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              height: 0,
              thickness: 0.6,
            ),
            GestureDetector(
              onTap: () async {
                await showBarModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  builder: (context) {
                    return PickNumberTenantAndRoom(
                      onChangeTenantAndRoom: controller.onChangeTenantAndRoom,
                      initRoom:
                          controller.searchHotelsParams.value.numberOfRooms,
                      initTenant:
                          controller.searchHotelsParams.value.numberOfTenants,
                    );
                  },
                );
              },
              child: Container(
                height: 48,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    const SizedBox.square(
                      dimension: 48,
                      child: Center(
                        child: Icon(
                          PhosphorIcons.user_bold,
                          color: Palette.blue400,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${controller.searchHotelsParams.value.numberOfRooms} phòng - ${controller.searchHotelsParams.value.numberOfTenants} người',
                        style: TextStyles.s14regularText,
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppRoundedButton(
              onPressed: () {
                Get.toNamed(RouteManager.searchHotel);
              },
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
