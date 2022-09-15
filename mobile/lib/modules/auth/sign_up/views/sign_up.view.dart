import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile/common/constants/asset_paths.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/rounded_button.widget.dart';
import 'package:mobile/common/widgets/row_social_login.widget.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/auth/sign_up/controllers/sign_up.controller.dart';
import 'package:mobile/modules/auth/sign_up/widgets/sign_up_form.widget.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

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
                SvgPicture.asset(AssetPaths.appIcon),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Đăng ký',
                      style: TextStyles.boldText.copyWith(fontSize: 24.sp),
                    ),
                  ),
                ),
                const SignUpForm(),
                SizedBox(
                  height: 20.h,
                ),
                RoundedButton(
                  onPressed: controller.signUp,
                  content: LocaleKeys.auth_sign_up.tr,
                  borderRadius: 50,
                ),
                Expanded(
                  child: RowSocialLogin(),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Đã có tài khoản?',
                        style: TextStyles.s17regularText
                            .copyWith(color: Palette.gray300),
                      ),
                      TextSpan(
                        text: ' Đăng nhập',
                        style: TextStyles.s17BoldText
                            .copyWith(color: Palette.blue300),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offAllNamed(RouteManager.login);
                          },
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
