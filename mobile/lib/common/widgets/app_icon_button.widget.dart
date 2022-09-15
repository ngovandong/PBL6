import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/common/theme/palette.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;

  final double width;
  final double height;

  final Color backgroundColor;
  final Color borderColor;

  final bool hasBorder;

  const AppIconButton({
    Key? key,
    required this.icon,
    this.width = 70,
    this.height = 36,
    this.backgroundColor = Colors.white,
    this.borderColor = Palette.gray100,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
