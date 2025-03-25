import 'package:flutter/material.dart';

import 'theme.dart';

class AppThemes {
  static ThemeData lightThemeData = themeData(
    colorScheme: _colorScheme,
    textTheme: _lightTextTheme,
  );

  // Define the color scheme for the apps
  static final ColorScheme _colorScheme = ColorScheme.fromSeed(
    primary: AppColors.gray900, // 303030
    onPrimary: AppColors.gray500,
    secondary: AppColors.gray400, // 909090
    onSecondary: AppColors.gray900,
    primaryContainer: AppColors.gray900,
    onPrimaryContainer: AppColors.gray900,
    surface: AppColors.white,
    onSurface: AppColors.gray900,
    seedColor: AppColors.gray900,
    background: AppColors.white,
  );
  static final TextTheme _lightTextTheme = AppTextStyles.lightTextTheme;

  static ThemeData themeData({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    // Check if the app is in dark mode
    final bool isDark = colorScheme.brightness == Brightness.dark;

    // Get the primary color for surfaces in light mode, and the surface color in dark mode
    final Color primarySurfaceColor =
        isDark ? colorScheme.surface : colorScheme.primary;

    // Apply Google Fonts to the text styles
    final TextTheme textTheme = AppTextStyles.lightTextTheme;
    textTheme.bodyLarge?.copyWith(
      height: 1.2,
      fontSize: 14.0,
      fontWeight: AppFontWeights.semiBold,
    );

    // Generate and return the ThemeData object
    return ThemeData(
      // Define the color scheme for the app
      brightness: colorScheme.brightness,
      primaryColor: primarySurfaceColor,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      cardColor: colorScheme.surface,

      dialogBackgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary,
      textTheme: textTheme,
      applyElevationOverlayColor: isDark,

      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray200),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray200),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      iconTheme: const IconThemeData(
        size: 30,
        color: AppColors.white,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lightGrey,
        thickness: 0.5,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.black100,
        unselectedItemColor: AppColors.gray200,
        // selectedFontSize: 24,
        // unselectedFontSize: 24,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.black100,
          backgroundColor: AppColors.black100,
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
