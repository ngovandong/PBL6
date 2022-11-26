import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/modules/auth/controllers/auth.controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackIcon: true,
          leadingBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          backIconColor: Palette.blue400,
        ),
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
                      'Bắt đầu với ReadyBooking',
                      style: TextStyles.boldText.copyWith(fontSize: 24.sp),
                    ),
                  ),
                ),
                // const LoginForm(),
                SizedBox(
                  height: 20.h,
                ),
                AppRoundedButton(
                  onPressed: controller.loginWithGoolge,
                  content: 'Đăng nhập bằng Google',
                  fontSize: 15,
                  isLoading: controller.isLoading.value,
                  borderRadius: 6,
                  backgroundColor: Colors.white,
                  showBorder: true,
                  showShadow: false,
                  prefixIcon: Assets.icons.auth.google.svg(),
                  textColor: Palette.zodiacBlue,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppRoundedButton(
                  onPressed: () {},
                  content: 'Đăng nhập bằng Apple',
                  fontSize: 15,
                  isLoading: controller.isLoading.value,
                  borderRadius: 6,
                  backgroundColor: Colors.black,
                  showShadow: false,
                  prefixIcon: Assets.icons.auth.apple.svg(color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Palette.gray300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Hoặc',
                        style: TextStyles.s14RegularText
                            .copyWith(color: Palette.gray200),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Palette.gray300,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                AppRoundedButton(
                  onPressed: () {
                    Get.toNamed(RouteManager.fillEmailView);
                  },
                  content: 'Tạo tài khoản',
                  fontSize: 15,
                  isLoading: controller.isLoading.value,
                  borderRadius: 6,
                  backgroundColor: Colors.white,
                  showShadow: false,
                  borderColor: Palette.blue300,
                  textColor: Palette.blue300,
                  showBorder: true,
                ),
                const Spacer(),
                const Text(
                  'Qua việc đăng nhập hoặc tạo tài khoản, bạn đồng ý với các Điều khoản và Điều kiện cũng như Chính sách An toàn và Bảo mật của chúng tôi',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
