import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/profile/controllers/user_setting.controller.dart';
import 'package:mobile/modules/profile/presentation/widgets/birthday_textfield.widget.dart';
import 'package:mobile/modules/profile/presentation/widgets/gender_dropdown.widget.dart';

class UserSettingView extends GetView<UserSettingController> {
  const UserSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          hasBackIcon: true,
          leadingBackgroundColor: Colors.white,
          backIconColor: Palette.zodiacBlue,
          backgroundColor: Colors.white,
          title: Text(
            LocaleKeys.profile_setting_account.tr,
            style: TextStyles.s17BoldText,
          ),
          toolbarHeight: 45,
          titleSpacing: 0,
          bottom: Container(
            color: Colors.white,
            height: 10,
          ),
          bottomSize: 10,
          actions: [
            Obx(() {
              if (controller.haveUpdated.value) {
                return IconButton(
                  onPressed: controller.updateUserInfo,
                  icon: const Icon(Icons.check),
                  color: Palette.zodiacBlue,
                );
              }
              return const SizedBox();
            })
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Họ và tên',
                  style: TextStyles.s14BoldText,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFormField(
                  labelText: 'Họ',
                  initialValue: controller.updatedUser.familyName,
                  extendField: false,
                  onChanged: controller.onChangeFamilyName,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextFormField(
                  labelText: 'Tên',
                  initialValue: controller.updatedUser.givenName,
                  extendField: false,
                  onChanged: controller.onChangeGivenName,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Thông tin chi tiết',
                  style: TextStyles.s14BoldText,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextFormField(
                  labelText: 'Số điện thoại',
                  initialValue: controller.updatedUser.phoneNumber,
                  extendField: false,
                  validator: controller.validatePhoneNumber,
                  onChanged: controller.onChangePhoneNumber,
                ),
                const SizedBox(
                  height: 10,
                ),
                GenderDropdownButton(
                  initValue: controller.updatedUser.gender,
                  onChanged: controller.onChangeGender,
                ),
                const SizedBox(
                  height: 10,
                ),
                BirdthDayTextField(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Liên hệ',
                  style: TextStyles.s14BoldText,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppTextFormField(
                  labelText: 'Địa chỉ',
                  initialValue: controller.updatedUser.address,
                  extendField: false,
                  onChanged: controller.onChangeAddress,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
