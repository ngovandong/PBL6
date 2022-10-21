import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

class CustomAppBar extends StatelessWidget {
  final bool isCenterTitle;
  final bool hasBackIcon;

  final Color backgroundColor;

  final double toolbarHeight;
  final double titleSpacing;

  final Widget title;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.isCenterTitle = true,
    this.hasBackIcon = false,
    this.backgroundColor = Palette.background,
    this.toolbarHeight = 60,
    this.titleSpacing = 15,
    required this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenterTitle,
      leadingWidth: hasBackIcon ? 40 : 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: toolbarHeight,
      titleSpacing: titleSpacing,
      title: title,
      actions: actions,
      leading: hasBackIcon
          ? AppIconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.chevron_left_rounded,
                size: 40,
                color: Colors.white,
              ),
              backgroundColor: Palette.blue400,
              hasBorder: false,
            )
          : null,
    );
  }
}
