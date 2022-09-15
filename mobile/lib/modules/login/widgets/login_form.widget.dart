import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/asset_paths.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/login/controllers/login.controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            AppTextFormField(
              textController: controller.usernameTextController,
              hintText: LocaleKeys.login_email.tr,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(18),
                child: SvgPicture.asset(
                  AssetPaths.mailIcon,
                  fit: BoxFit.fill,
                ),
              ),
              validator: controller.validateUsername,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextFormField(
              textController: controller.passwordTextController,
              hintText: LocaleKeys.login_password.tr,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(AssetPaths.lockIcon),
              ),
              validator: controller.validatePassword,
              isObscure: true,
              errorText: controller.errorText.value,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                LocaleKeys.login_forgot_password.tr,
                style: TextStyles.s14BoldText.copyWith(color: Palette.blue400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
