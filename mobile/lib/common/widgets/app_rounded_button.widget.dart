import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';
import 'package:mobile/common/widgets/loading_dot.widget.dart';

class AppRoundedButton extends StatefulWidget {
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
  final bool isFitBox;

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
    this.isFitBox = false,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<AppRoundedButton> createState() => _AppRoundedButtonState();
}

class _AppRoundedButtonState extends State<AppRoundedButton> {
  late Widget child;

  @override
  void initState() {
    _setChild(true);
    super.initState();
  }

  void _setChild(bool isInit) {
    final Widget childInButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.prefixIcon != null) widget.prefixIcon!,
        if (widget.prefixIcon != null)
          const SizedBox(
            width: 15,
          ),
        Text(
          widget.content,
          style: TextStyles.boldText
              .copyWith(fontSize: widget.fontSize, color: widget.textColor),
        ),
        if (widget.suffixIcon != null)
          const SizedBox(
            width: 15,
          ),
        if (widget.suffixIcon != null) widget.suffixIcon!,
      ],
    );

    if (isInit) {
      child = childInButton;
    } else {
      setState(() {
        child = childInButton;
      });
    }
  }

  @override
  void didUpdateWidget(covariant AppRoundedButton oldWidget) {
    _setChild(false);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
              widget.isDisable
                  ? widget.disableBackgroundColor
                  : widget.backgroundColor,
            ),
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed:
            (widget.isLoading || widget.isDisable) ? null : widget.onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: widget.isFitBox ? null : Size(widget.width, widget.height),
          minimumSize:
              widget.isFitBox ? null : Size(widget.width, widget.height),
          maximumSize: widget.isFitBox == true
              ? null
              : Size(widget.width, widget.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            side: widget.showBorder
                ? BorderSide(color: widget.borderColor)
                : BorderSide.none,
          ),
          shadowColor: widget.showShadow ? Colors.black : Colors.transparent,
          elevation: widget.showShadow ? 5 : 0,
          backgroundColor: widget.isDisable
              ? widget.disableBackgroundColor
              : widget.backgroundColor,
          splashFactory: NoSplash.splashFactory,
          foregroundColor: widget.isDisable
              ? widget.disableBackgroundColor
              : widget.backgroundColor,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledBackgroundColor: widget.disableBackgroundColor,
          disabledForegroundColor: widget.disableBackgroundColor,
          enableFeedback: false,
        ),
        child: widget.isLoading
            ? const LoadingDot()
            : (widget.isFitBox
                ? FittedBox(
                    child: child,
                  )
                : child),
      ),
    );
  }
}
