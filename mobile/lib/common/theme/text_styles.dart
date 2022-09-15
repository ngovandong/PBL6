import 'package:flutter/material.dart';
import 'package:mobile/common/constants/font_family.dart';
import 'package:mobile/common/theme/palette.dart';

abstract class TextStyles {
  // Regular
  static const TextStyle regularText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle s11regularText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w400,
    fontSize: 11,
  );
  static const TextStyle s14regularText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static const TextStyle s17regularText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );

  // Medium
  static const TextStyle mediumText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle s11MediumText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );
  static const TextStyle s14MediumText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );
  static const TextStyle s17MediumText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  // Bold
  static const TextStyle boldText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle s11BoldText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w700,
    fontSize: 11,
  );
  static const TextStyle s14BoldText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  static const TextStyle s17BoldText = TextStyle(
    fontFamily: FontFamily.mulish,
    color: Palette.zodiacBlue,
    fontWeight: FontWeight.w700,
    fontSize: 17,
  );
}
