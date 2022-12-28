import 'package:flutter/material.dart';
import 'package:mobile/common/theme/palette.dart';
import 'package:mobile/common/theme/text_styles.dart';

class IconTitle extends StatelessWidget {
  final IconData icon;
  final String? title;
  final Widget? child;
  final TextStyle? textStyle;

  const IconTitle({
    super.key,
    required this.icon,
    this.title,
    this.child,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: Palette.zodiacBlue,
              ),
              const Spacer()
            ],
          ),
        ),
        title != null
            ? Expanded(
                child: Text(
                  title!,
                  style: textStyle ??
                      TextStyles.s14MediumText
                          .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              )
            : child!
      ],
    );
  }
}
