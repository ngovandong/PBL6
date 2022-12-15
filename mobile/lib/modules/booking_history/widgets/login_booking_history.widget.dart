import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/router/route_manager.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/generated/assets.gen.dart';

class LoginBookingHistory extends StatelessWidget {
  const LoginBookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UIConfigs.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.lotties.loadingTravel,
            width: Get.width * 0.8,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Hiện bạn đang không có đơn đặt nào',
            style: TextStyles.s17BoldText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Đăng nhập để xem tất cả đơn đặt đang có hiệu lực',
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
