import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

class SubmitSheetHeader extends StatelessWidget {
  final String title;
  final Function()? submitAction;

  const SubmitSheetHeader({
    super.key,
    required this.title,
    this.submitAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Palette.gray100, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            onPressed: () async {
              Get.back();
              await submitAction?.call();
            },
            hasBorder: false,
            size: 40,
            icon: const Icon(
              Icons.close,
              size: 20,
              color: Palette.gray400,
            ),
          ),
          Text(
            title,
            style: TextStyles.s17BoldText,
          ),
          AppIconButton(
            onPressed: () {
              Get.back();
            },
            size: 35,
            backgroundColor: Palette.blue400,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
