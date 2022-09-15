import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
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
              hintText: LocaleKeys.login_username.tr,
              prefixIcon: const Icon(
                Icons.person,
                color: Palette.blue200,
                size: 18,
              ),
              validator: controller.validateUsername,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppTextFormField(
              textController: controller.passwordTextController,
              hintText: LocaleKeys.login_password.tr,
              prefixIcon: const Icon(
                Icons.lock,
                color: Palette.blue200,
                size: 18,
              ),
              suffixIcon: GestureDetector(
                onTap: controller.changeShowPassword,
                child: Icon(
                  controller.showPassword.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: controller.showPassword.value
                      ? Palette.blue200
                      : Colors.grey,
                  size: 18,
                ),
              ),
              validator: controller.validatePassword,
              isObscure: !controller.showPassword.value,
              errorText: controller.errorText.value,
            ),
          ],
        ),
      ),
    );
  }
}
