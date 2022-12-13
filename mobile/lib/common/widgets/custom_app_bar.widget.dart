import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/widgets/app_icon_button.widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isCenterTitle;
  final bool hasBackIcon;

  final Color backgroundColor;
  final Color leadingBackgroundColor;
  final Color backIconColor;

  final double toolbarHeight;
  final double titleSpacing;
  final double elevation;
  final double bottomSize;

  final Widget? title;
  final Widget? bottom;
  final List<Widget> actions;

  final Function()? onLeadingAction;

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
    this.bottomSize = 45,
    this.title,
    this.bottom,
    this.actions = const [],
    this.onLeadingAction,
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
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomSize),
              child: bottom!,
            )
          : null,
      actions: actions,
      leading: hasBackIcon
          ? AppIconButton(
              onPressed: () {
                if (onLeadingAction != null) {
                  onLeadingAction?.call();
                } else {
                  Get.back();
                }
              },
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

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
