import 'package:flutter/material.dart';
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
  final Color borderColor;
  final Color disableBackgroundColor;
  final Color textColor;

  final String content;

  final bool isLoading;
  final bool isDisable;
  final bool showShadow;
  final bool showBorder;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppRoundedButton({
    Key? key,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.fontSize = 18,
    this.borderRadius = 10,
    this.backgroundColor = Palette.blue300,
    this.borderColor = Palette.gray200,
    this.disableBackgroundColor = Palette.gray300,
    this.textColor = Colors.white,
    required this.content,
    this.isDisable = false,
    this.isLoading = false,
    this.showShadow = true,
    this.showBorder = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (isLoading || isDisable) ? null : onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        minimumSize: Size(width, height),
        maximumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: showBorder ? BorderSide(color: borderColor) : BorderSide.none,
        ),
        shadowColor: showShadow ? Colors.black : null,
        elevation: showShadow ? 5 : 0,
        backgroundColor: isDisable ? disableBackgroundColor : backgroundColor,
        splashFactory: NoSplash.splashFactory,
        foregroundColor: isDisable ? disableBackgroundColor : backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        disabledBackgroundColor: disableBackgroundColor,
        disabledForegroundColor: disableBackgroundColor,
      ),
      child: isLoading
          ? const LoadingDot()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null) prefixIcon!,
                if (prefixIcon != null)
                  const SizedBox(
                    width: 15,
                  ),
                Text(
                  content,
                  style: TextStyles.boldText
                      .copyWith(fontSize: fontSize, color: textColor),
                ),
                if (suffixIcon != null)
                  const SizedBox(
                    width: 15,
                  ),
                if (suffixIcon != null) suffixIcon!,
              ],
            ),
    );
  }
}
