import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/app_text_form_field.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/controllers/fill_email.controller.dart';

class FillEmailView extends GetView<FillEmailController> {
  const FillEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      behavior: HitTestBehavior.translucent,
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackIcon: true,
          title: SizedBox(),
          backgroundColor: Palette.blue400,
        ),
        body: Padding(
          padding: const EdgeInsets.all(UIConfigs.horizontalPadding),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhập địa chỉ email của bạn',
                  style: TextStyles.boldText.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (controller.authContent.isNotEmpty)
                  Text(
                    controller.authContent.value,
                    style: TextStyles.s14MediumText
                        .copyWith(color: Palette.red400),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        textController: controller.emailTextController,
                        focusNode: controller.emailFocusNode,
                        hintText: LocaleKeys.auth_email.tr,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Assets.icons.auth.mail.svg(
                            fit: BoxFit.fill,
                          ),
                        ),
                        // validator: controller.validateEmail,
                        onChanged: controller.onChangedEmail,
                        errorText: controller.emailError.value,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (controller.showPassword.value)
                        AppTextFormField(
                          textController: controller.passwordTextController,
                          focusNode: controller.passwordFocusNode,
                          hintText: LocaleKeys.auth_password.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Assets.icons.auth.lock.svg(),
                          ),
                          // validator: controller.validatePassword,
                          isObscure: true,
                          errorText: controller.passwordError.value,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppRoundedButton(
                  onPressed: controller.verifyEmailAuth,
                  content: controller.authButton.value,
                  showShadow: false,
                  borderRadius: 6,
                  backgroundColor: Palette.blue400,
                  isLoading: controller.isLoading.value,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
