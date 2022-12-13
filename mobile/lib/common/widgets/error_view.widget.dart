import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';

class ErrorBanner extends StatelessWidget {
  final String? title;
  final Function()? action;

  const ErrorBanner({
    super.key,
    this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.lotties.errorAlert),
          Text(
            LocaleKeys.share_error_message.tr,
            style: TextStyles.boldText
                .copyWith(color: Palette.red500, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          AppRoundedButton(
            onPressed: () {
              action ?? Get.back();
            },
            width: 250,
            height: 45,
            backgroundColor: Palette.red500,
            showShadow: false,
            content: title ?? 'Trở về trang trước',
          )
        ],
      ),
    );
  }
}
