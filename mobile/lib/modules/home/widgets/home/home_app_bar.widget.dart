import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';
import 'package:mobile/common/widgets/custom_app_bar.widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      isCenterTitle: false,
      title: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Minh Đức',
            style: TextStyles.s17BoldText,
          )
        ],
      ),
      actions: [
        AppIconButton(
          onPressed: () {},
          width: 40,
          height: 40,
          borderColor: Palette.blue400,
          isCircle: true,
          icon: Icon(
            PhosphorIcons.bell_ringing_bold,
            color: Palette.blue400,
            size: 18.sp,
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
