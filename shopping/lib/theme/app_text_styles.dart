import 'package:flutter/material.dart';

import '../const/const.dart';
import 'theme.dart';

class AppTextStyles {
  static TextStyle _defaultTextStyle({
    required double fontSize,
    required FontWeight? fontWeight,
    required double height,
    Color? color,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? AppConst.nunito,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color ?? AppColors.gray900,
    );
  }

  static final TextTheme lightTextTheme = TextTheme(
    bodySmall: _defaultTextStyle(
      fontFamily: AppConst.merriweather,
      fontSize: 16,
      fontWeight: AppFontWeights.bold,
      height: 1.3,
      color: AppColors.gray900,
    ),
    bodyMedium: _defaultTextStyle(
      fontFamily: AppConst.gelasio,
      fontSize: 18,
      fontWeight: AppFontWeights.regular,
      height: 1.4,
      color: AppColors.gray900,
    ),
    bodyLarge: _defaultTextStyle(
      fontFamily: AppConst.gelasio,
      fontSize: 24,
      fontWeight: AppFontWeights.medium,
      height: 1.3,
      color: AppColors.gray900,
    ),
    labelSmall: _defaultTextStyle(
      fontSize: 14,
      fontWeight: AppFontWeights.regular,
      height: 1.4,
      color: AppColors.gray400,
    ),
    labelMedium: _defaultTextStyle(
      fontSize: 18,
      fontWeight: AppFontWeights.semiBold,
      height: 1.4,
      color: AppColors.gray900,
    ),
  );
}
