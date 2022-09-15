import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';

class RoundedButton extends StatelessWidget {
  final void Function() onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;

  final Color backgroundColor;
  final Color disableBackgroundColor;
  final Color textColor;

  final String content;

  final bool isLoading;
  final bool showShadow;

  const RoundedButton({
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
    this.isLoading = false,
    this.showShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadowColor: showShadow ? Colors.black : null,
        elevation: showShadow ? 5 : null,
        backgroundColor: backgroundColor,
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
