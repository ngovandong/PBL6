import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';

class LoginViewData extends StatelessWidget {
  final String lottiePath;
  final String title;
  final String content;

  const LoginViewData({
    super.key,
    required this.lottiePath,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UIConfigs.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            lottiePath,
            width: Get.width * 0.8,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyles.s17BoldText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: TextStyles.s17RegularText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          AppRoundedButton(
            onPressed: () async {
              await Get.toNamed(RouteManager.auth);
            },
            content: 'Đăng nhập',
            showShadow: false,
            width: Get.width / 2,
          )
        ],
      ),
    );
  }
}
