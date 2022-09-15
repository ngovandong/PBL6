import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/constants/asset_paths.dart';
import 'package:mobile/modules/welcome/controllers/welcome.controller.dart';

class SplashScreen extends GetView<WelcomeController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AssetPaths.appIcon,
          width: 100.w,
          height: 100.h,
        ),
      ),
    );
  }
}
