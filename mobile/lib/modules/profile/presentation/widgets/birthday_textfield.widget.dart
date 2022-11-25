import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/modules/profile/controllers/user_setting.controller.dart';

// ignore: must_be_immutable
class BirdthDayTextField extends GetView<UserSettingController> {
  late DateTime updatedDate;

  BirdthDayTextField({super.key}) {
    updatedDate = controller.updatedUser.birthDay ?? DateTime(2022);
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      textController: controller.birthDayTextController,
      labelText: 'Ngày sinh',
      readOnly: true,
      onTap: () {
        Get.bottomSheet(
          Container(
            height: 250,
            padding: const EdgeInsets.only(
              top: 5.0,
              left: UIConfigs.horizontalPadding,
              right: UIConfigs.horizontalPadding,
            ),
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      initialDateTime: updatedDate,
                      mode: CupertinoDatePickerMode.date,
                      maximumDate: DateTime.now(),
                      maximumYear: DateTime.now().year,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newDate) {
                        updatedDate = newDate;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppRoundedButton(
                    onPressed: () {
                      controller.onChangeBirthDay(updatedDate);
                      Get.back();
                    },
                    content: 'Chọn ngày',
                    fontSize: 15,
                    showShadow: false,
                    height: 45,
                    backgroundColor: Palette.blue400,
                  )
                ],
              ),
            ),
          ),
        );
      },
      extendField: false,
    );
  }
}
