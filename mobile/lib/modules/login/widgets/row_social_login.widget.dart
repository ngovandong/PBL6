import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/common/constants/asset_paths.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

class RowSocialLogin extends StatelessWidget {
  RowSocialLogin({super.key});

  final List<String> iconPaths = [
    AssetPaths.facebookIcon,
    AssetPaths.googleIcon,
    AssetPaths.appleIcon
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                'Đăng nhập với',
                style:
                    TextStyles.s14regularText.copyWith(color: Palette.gray200),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              return AppIconButton(
                icon: AppIconButton(
                  icon: SvgPicture.asset(
                    iconPaths[index],
                    width: 22,
                    height: 22,
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
