import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/common/widgets/index.dart';
import 'package:mobile/generated/locales.g.dart';

class FindBookingHistoryView extends StatelessWidget {
  const FindBookingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackIcon: true,
        title: const AppTextFormField(
          hintText: 'Tìm kiếm lịch sử đặt phòng',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Palette.gray300,
          ),
          hintColor: Palette.gray200,
          fillColor: Palette.background,
          borderColor: Palette.background,
          extendField: false,
        ),
        leadingBackgroundColor: Colors.white,
        backIconColor: Palette.blue400,
        backgroundColor: Colors.white,
        elevation: 1.5,
        actions: [
          AppIconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 152,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Palette.gray200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const Text(
                        'Lọc lịch sử công việc',
                        style: TextStyles.s17BoldText,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppRoundedButton(
                        onPressed: () {},
                        width: Get.width / 2 + 50,
                        content: 'Tất cả',
                        height: 40,
                        fontSize: 14,
                        showShadow: false,
                        backgroundColor: Colors.white,
                        textColor: Palette.blue400,
                        borderColor: Palette.blue400,
                        borderRadius: 8,
                        showBorder: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppRoundedButton(
                        onPressed: () {},
                        width: Get.width / 2 + 50,
                        content: LocaleKeys.booking_history_ongoing.tr,
                        height: 40,
                        fontSize: 14,
                        showShadow: false,
                        backgroundColor: Colors.white,
                        textColor: Palette.gray400,
                        borderRadius: 8,
                        showBorder: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppRoundedButton(
                        onPressed: () {},
                        width: Get.width / 2 + 50,
                        content: LocaleKeys.booking_history_ordered.tr,
                        height: 40,
                        fontSize: 14,
                        showShadow: false,
                        backgroundColor: Colors.white,
                        textColor: Palette.gray400,
                        borderRadius: 8,
                        showBorder: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppRoundedButton(
                        onPressed: () {},
                        width: Get.width / 2 + 50,
                        content: LocaleKeys.booking_history_cancel.tr,
                        height: 40,
                        fontSize: 14,
                        showShadow: false,
                        backgroundColor: Colors.white,
                        textColor: Palette.gray400,
                        borderRadius: 8,
                        showBorder: true,
                      )
                    ],
                  ),
                ),
              );
            },
            height: double.infinity,
            width: 50,
            hasBorder: false,
            icon: const Icon(
              PhosphorIcons.sliders_horizontal_light,
              color: Palette.blue400,
            ),
          )
        ],
      ),
      body: Column(),
    );
  }
}
