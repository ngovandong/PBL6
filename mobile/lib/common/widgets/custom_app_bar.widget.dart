import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

class CustomAppBar extends StatelessWidget {
  final bool isCenterTitle;
  final bool hasBackIcon;

  final Color backgroundColor;
  final Color leadingBackgroundColor;
  final Color backIconColor;

  final double toolbarHeight;
  final double titleSpacing;
  final double elevation;

  final Widget title;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.isCenterTitle = true,
    this.hasBackIcon = false,
    this.backgroundColor = Palette.background,
    this.leadingBackgroundColor = Palette.blue400,
    this.backIconColor = Colors.white,
    this.toolbarHeight = 60,
    this.titleSpacing = 15,
    this.elevation = 0,
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
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      titleSpacing: titleSpacing,
      title: title,
      actions: actions,
      leading: hasBackIcon
          ? AppIconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.chevron_left_rounded,
                size: 40,
                color: backIconColor,
              ),
              backgroundColor: leadingBackgroundColor,
              hasBorder: false,
            )
          : null,
    );
  }
}
