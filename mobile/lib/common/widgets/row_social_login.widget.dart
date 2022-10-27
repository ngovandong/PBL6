import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/generated/assets.gen.dart';
import 'package:mobile/modules/base/controllers/auth.controller.dart';

class RowSocialLogin extends GetView<AuthController> {
  RowSocialLogin({super.key});

  final List<String> iconPaths = [
    Assets.icons.auth.facebook.path,
    Assets.icons.auth.google.path,
    Assets.icons.auth.apple.path
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
                    TextStyles.s14RegularText.copyWith(color: Palette.gray200),
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
                height: 40,
                onPressed: controller.loginWithGoolge,
                icon: SvgPicture.asset(
                  iconPaths[index],
                  width: 22,
                  height: 22,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
