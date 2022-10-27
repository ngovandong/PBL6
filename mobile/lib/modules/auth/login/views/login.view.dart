import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/row_social_login.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/login/controllers/login.controller.dart';
import 'package:mobile/modules/auth/login/widgets/login_form.widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 20,
            ),
            child: Column(
              children: [
                Assets.icons.app.appIcon.svg(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Đăng nhập',
                      style: TextStyles.boldText.copyWith(fontSize: 24.sp),
                    ),
                  ),
                ),
                const LoginForm(),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => AppRoundedButton(
                    onPressed: controller.login,
                    content: LocaleKeys.auth_login.tr,
                    isLoading: controller.isLoading.value,
                    borderRadius: 50,
                  ),
                ),
                Expanded(
                  child: RowSocialLogin(),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Chưa có tài khoản?',
                        style: TextStyles.s17RegularText
                            .copyWith(color: Palette.gray300),
                      ),
                      TextSpan(
                        text: ' Đăng ký',
                        style: TextStyles.s17BoldText
                            .copyWith(color: Palette.blue300),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.navigateToSignUp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
