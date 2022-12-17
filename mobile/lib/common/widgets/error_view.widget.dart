import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/generated/locales.g.dart';

class ErrorBanner extends StatelessWidget {
  final String? title;
  final Function()? action;
  final bool showAction;

  const ErrorBanner({
    super.key,
    this.title,
    this.action,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UIConfigs.horizontalPadding),
      child: Center(
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
            if (showAction)
              AppRoundedButton(
                onPressed: () {
                  action?.call() ?? Get.back();
                },
                width: 250,
                height: 45,
                backgroundColor: Palette.red500,
                showShadow: false,
                content: title ?? 'Trở về trang trước',
              )
          ],
        ),
      ),
    );
  }
}
