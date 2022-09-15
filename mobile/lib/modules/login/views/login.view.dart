import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/modules/login/controllers/login.controller.dart';
import 'package:mobile/modules/login/widgets/login_form.widget.dart';
import 'package:mobile/modules/login/widgets/rounded_button.widget.dart';

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
          child: Padding(
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
              top: MediaQuery.of(context).padding.top + 10,
            ),
            child: Column(
              children: [
                const LoginForm(),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => RoundedButton(
                    onPressed: controller.login,
                    content: LocaleKeys.login_login.tr,
                    isLoading: controller.isLoading.value,
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
