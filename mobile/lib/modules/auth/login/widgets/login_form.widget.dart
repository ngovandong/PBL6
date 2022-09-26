import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/login/controllers/login.controller.dart';

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
              hintText: LocaleKeys.auth_email.tr,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(18),
                child: Assets.icons.auth.mail.svg(
                  fit: BoxFit.fill,
                ),
              ),
              validator: controller.validateEmail,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextFormField(
              textController: controller.passwordTextController,
              hintText: LocaleKeys.auth_password.tr,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Assets.icons.auth.lock.svg(),
              ),
              validator: controller.validatePassword,
              isObscure: true,
              errorText: controller.errorText.value,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                LocaleKeys.auth_forgot_password.tr,
                style: TextStyles.s14BoldText.copyWith(color: Palette.blue400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
