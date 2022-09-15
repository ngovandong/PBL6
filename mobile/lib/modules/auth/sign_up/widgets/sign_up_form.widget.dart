import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/asset_paths.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/sign_up/controllers/sign_up.controller.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          AppTextFormField(
            textController: controller.nameTextController,
            hintText: LocaleKeys.auth_name.tr,
            prefixIcon: const Icon(
              PhosphorIcons.user_fill,
              color: Palette.gray100,
            ),
            validator: controller.validateName,
          ),
          SizedBox(
            height: 5.h,
          ),
          AppTextFormField(
            textController: controller.emailTextController,
            hintText: LocaleKeys.auth_email.tr,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                AssetPaths.mailIcon,
                fit: BoxFit.fill,
              ),
            ),
            validator: controller.validateEmail,
          ),
          SizedBox(
            height: 5.h,
          ),
          AppTextFormField(
            textController: controller.passwordTextController,
            hintText: LocaleKeys.auth_password.tr,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(AssetPaths.lockIcon),
            ),
            validator: controller.validatePassword,
            isObscure: true,
          ),
          SizedBox(
            height: 5.h,
          ),
          AppTextFormField(
            textController: controller.confirmPasswordTextController,
            hintText: LocaleKeys.auth_confirm_password.tr,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(AssetPaths.lockIcon),
            ),
            validator: controller.validateConfirmPassword,
            isObscure: true,
          )
        ],
      ),
    );
  }
}
