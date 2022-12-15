import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';

class AppIconButton extends StatelessWidget {
  final void Function() onPressed;

  final Widget icon;

  final double width;
  final double height;
  final double? size;
  final double borderRadius;

  final Color backgroundColor;
  final Color borderColor;

  final bool hasBorder;
  final bool isCircle;
  final bool isDisable;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.width = 70,
    this.height = 36,
    this.size,
    this.backgroundColor = Colors.white,
    this.borderColor = Palette.gray100,
    this.borderRadius = 8,
    this.hasBorder = true,
    this.isCircle = false,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: isDisable ? null : onPressed,
      constraints: BoxConstraints(
        maxHeight: size ?? height,
        maxWidth: size ?? width,
        minHeight: size ?? height,
        minWidth: size ?? width,
      ),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      fillColor: backgroundColor,
      splashColor: backgroundColor,
      highlightColor: backgroundColor,
      shape: isCircle
          ? CircleBorder(
              side: hasBorder
                  ? BorderSide(color: borderColor, width: 0.6)
                  : BorderSide.none,
            )
          : RoundedRectangleBorder(
              side: hasBorder
                  ? BorderSide(
                      color: borderColor,
                      width: 0.6,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
      child: Center(
        child: icon,
      ),
    );

    // TextButton(
    //   onPressed: isDisable ? null : onPressed,
    //   style:

    //   TextButton.styleFrom(
    //     fixedSize: Size(width, height),
    //     minimumSize: Size(width, height),
    //     visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //     padding: EdgeInsets.zero,
    //     elevation: 0,
    //     shape: isCircle
    //         ? CircleBorder(
    //             side: hasBorder
    //                 ? BorderSide(
    //                     color: borderColor,
    //                     width: 0.6,
    //                   )
    //                 : BorderSide.none,
    //           )
    //         : RoundedRectangleBorder(
    //             side: hasBorder
    //                 ? BorderSide(
    //                     color: borderColor,
    //                     width: 0.6,
    //                   )
    //                 : BorderSide.none,
    //             borderRadius: BorderRadius.circular(borderRadius),
    //           ),
    //     backgroundColor: backgroundColor,
    //     foregroundColor: backgroundColor,
    //     disabledBackgroundColor: backgroundColor,
    //     splashFactory: NoSplash.splashFactory,
    //   ),
    //   child: Center(
    //     child: icon,
    //   ),
    // );
  }
}
