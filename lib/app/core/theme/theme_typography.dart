import 'package:flutter/material.dart';
import 'package:teste/app/core/theme/theme_colors.dart';

class ThemeTypography {
  const ThemeTypography._();

  static TextStyle get headline1 => TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: ThemeColors.kTextBlack
  );

  static TextStyle get sub1 => TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: ThemeColors.kTextBase
  );
}
