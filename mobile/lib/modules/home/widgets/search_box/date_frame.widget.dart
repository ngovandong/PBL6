import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:mobile/common/extensions/datetime.extension.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/utils/bottom_sheet.util.dart';
import 'package:mobile/common/widgets/app_date_picker.widget.dart';
import 'package:mobile/modules/home/controllers/home.controller.dart';
import 'package:mobile/modules/home/data/models/dtos/search_hotels.dto.dart';

class DateFrame extends GetView<HomeController> {
  const DateFrame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final SearchHotelsDTO searchHotelsParams =
            controller.searchHotelsParams.value;

        await BottomSheetUtil.show(
          child: AppDatePicker(
            initStartDate: searchHotelsParams.checkinDate,
            initEndDate: searchHotelsParams.checkoutDate,
            onSubmitRange: controller.onChangeCheckinCheckoutDate,
          ),
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
                      style: TextStyles.s14RegularText
                          .copyWith(color: Palette.gray100),
                    ),
                    TextSpan(
                      text: controller
                          .searchHotelsParams.value.checkinDate.toDisplayDate,
                      style: TextStyles.s14RegularText,
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
                      style: TextStyles.s14RegularText
                          .copyWith(color: Palette.gray100),
                    ),
                    TextSpan(
                      text: controller
                          .searchHotelsParams.value.checkoutDate.toDisplayDate,
                      style: TextStyles.s14RegularText,
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
    );
  }
}
