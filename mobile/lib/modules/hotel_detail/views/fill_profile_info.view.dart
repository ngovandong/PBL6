import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/hotel_detail/controllers/fill_profile_info.controller.dart';

class FillProfileInfoView extends GetView<FillProfileInfoController> {
  const FillProfileInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackIcon: true,
          title: Text(
            'Thông tin cá nhân',
            style: TextStyles.s17BoldText,
          ),
          elevation: 2,
          leadingBackgroundColor: Palette.background,
          backIconColor: Palette.zodiacBlue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    labelText: 'Họ',
                    initialValue: controller.bookingProfile.familyName,
                    extendField: false,
                    onChanged: controller.onChangeFamilyName,
                    validator: controller.validateFirstName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    labelText: 'Tên',
                    initialValue: controller.bookingProfile.givenName,
                    extendField: false,
                    onChanged: controller.onChangeGivenName,
                    validator: controller.validateSecondName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    labelText: 'Email',
                    initialValue: controller.bookingProfile.email,
                    extendField: false,
                    onChanged: controller.onChangeFamilyName,
                    validator: controller.validateEmail,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFormField(
                    labelText: 'Số điện thoại',
                    initialValue: controller.bookingProfile.phoneNumber,
                    extendField: false,
                    validator: controller.validatePhoneNumber,
                    onChanged: controller.onChangePhoneNumber,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.hotel_detail_saved_info_account.tr,
                        style: TextStyles.s14MediumText,
                      ),
                      CupertinoSwitch(
                        value: false,
                        activeColor: Palette.blue400,
                        onChanged: (bool? value) {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
          child: SafeArea(
            top: false,
            child: AppRoundedButton(
              onPressed: controller.submitProfileInfo,
              content: 'Tiếp tục',
              fontSize: 15,
              showShadow: false,
              backgroundColor: Palette.blue400,
            ),
          ),
        ),
      ),
    );
  }
}
