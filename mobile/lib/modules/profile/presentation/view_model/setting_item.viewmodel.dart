import 'package:flutter/material.dart';

class SettingItemViewModel {
  final IconData prefixIcon;
  final String title;
  final IconData suffixIcon;
  Color? backgroundColor;
  Color? textColor;
  final void Function()? onPressed;

  SettingItemViewModel({
    required this.prefixIcon,
    required this.title,
    this.suffixIcon = Icons.chevron_right_rounded,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
  });
}
