import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/modules/welcome/controllers/welcome.controller.dart';

class SplashScreen extends GetView<WelcomeController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.icons.app.appIcon.svg(
          width: 100.w,
          height: 100.h,
        ),
      ),
    );
  }
}
