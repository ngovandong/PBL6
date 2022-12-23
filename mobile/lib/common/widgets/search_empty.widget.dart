import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/common/constants/ui_configs.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_rounded_button.widget.dart';
import 'package:mobile/generated/assets.gen.dart';

class SearchEmpty extends StatelessWidget {
  final String? content;
  final double? width;
  final Function()? onPressed;

  const SearchEmpty({
    super.key,
    this.content,
    this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.lotties.searchEmpty,
            width: width,
          ),
          if (content != null)
            const SizedBox(
              height: UIConfigs.horizontalPadding,
            ),
          if (content != null)
            Text(
              content!,
              style: TextStyles.s17BoldText,
            ),
          if (onPressed != null)
            const SizedBox(
              height: UIConfigs.horizontalPadding,
            ),
          if (onPressed != null)
            AppRoundedButton(
              onPressed: onPressed!,
              content: 'Cập nhật',
              isFitBox: true,
              showShadow: false,
              backgroundColor: Palette.blue400,
            )
        ],
      ),
    );
  }
}
