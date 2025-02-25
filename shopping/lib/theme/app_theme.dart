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
    onPrimary: AppColors.gray900,
    secondary: AppColors.gray400, // 909090
    onSecondary: AppColors.gray900,
    primaryContainer: AppColors.gray900,
    onPrimaryContainer: AppColors.gray900,
    surface: AppColors.gray900,
    onSurface: AppColors.gray900,
    seedColor: AppColors.gray900,
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
    final labelStyle = textTheme.bodyLarge?.copyWith(
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
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      dialogBackgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary,
      textTheme: textTheme,
      applyElevationOverlayColor: isDark,
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        titleTextStyle: textTheme.bodyLarge?.copyWith(
          fontSize: 32.0,
          height: 1.1,
          fontWeight: AppFontWeights.medium,
        ),
        contentTextStyle: textTheme.bodyLarge?.copyWith(
          fontSize: 21.0,
          height: 1.5,
          fontWeight: AppFontWeights.medium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColors.gray500,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: AppColors.gray500,
            width: 2,
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.gray500,
        modalBarrierColor: AppColors.gray500.withOpacity(0.6),
      ),
      cardTheme: CardTheme(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: CircleBorder(side: BorderSide(color: Colors.white)),
        elevation: 4.0,
        backgroundColor: Color(0xFFF4EFEA),
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelPadding: const EdgeInsets.all(6.0),
        labelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        labelColor: AppColors.gray900,
        unselectedLabelColor: AppColors.gray900,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        titleTextStyle: textTheme.bodyLarge?.copyWith(
          fontSize: 32.0,
          fontWeight: AppFontWeights.bold,
          color: AppColors.gray500,
        ),
      ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   selectedItemColor: colorScheme.secondary,
      //   selectedLabelStyle: textTheme.labelSmall,
      //   unselectedLabelStyle: textTheme.labelSmall,
      //   selectedIconTheme: const IconThemeData(
      //     size: 30,
      //   ),
      //   unselectedIconTheme: const IconThemeData(
      //     size: 20,
      //   ),
      // ),
      colorScheme: colorScheme.copyWith(
        surface: colorScheme.surface,
        error: colorScheme.error,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.surface),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.gray500,
          backgroundColor: AppColors.gray500,
          disabledBackgroundColor: colorScheme.surface,
          disabledForegroundColor: AppColors.black100,
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
