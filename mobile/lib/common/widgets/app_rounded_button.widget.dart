import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';

class AppRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;

  final Color backgroundColor;
  final Color disableBackgroundColor;
  final Color textColor;

  final String content;

  final bool isLoading;
  final bool isDisable;
  final bool showShadow;
  final bool showBorder;

  const AppRoundedButton({
    Key? key,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.fontSize = 18,
    this.borderRadius = 10,
    this.backgroundColor = Palette.blue300,
    this.disableBackgroundColor = Palette.gray300,
    this.textColor = Colors.white,
    required this.content,
    this.isDisable = false,
    this.isLoading = false,
    this.showShadow = true,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading || isDisable) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: showBorder
              ? const BorderSide(color: Palette.gray200)
              : BorderSide.none,
        ),
        shadowColor: showShadow ? Colors.black : null,
        elevation: showShadow ? 5 : 0,
        backgroundColor: isDisable ? disableBackgroundColor : backgroundColor,
        splashFactory: NoSplash.splashFactory,
        foregroundColor: isDisable ? disableBackgroundColor : backgroundColor,
      ),
      child: isLoading
          ? const LoadingDot()
          : Text(
              content,
              style: TextStyles.boldText
                  .copyWith(fontSize: fontSize.sp, color: textColor),
            ),
    );
  }
}
