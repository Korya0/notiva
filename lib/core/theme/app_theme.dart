import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_colors.dart';
import 'package:notiva/core/theme/app_fonts.dart';
import 'package:notiva/core/theme/app_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.vibrantTeal,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      extensions: const [
        AppColorsExtension.light,
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.vibrantTeal,
        primary: AppColors.vibrantTeal,
        secondary: AppColors.deepNavyBlue,
        surface: AppColors.containerLight,
        error: AppColors.error,
      ),
      fontFamily: isArabic ? AppFonts.ibmPlexSansArabic : AppFonts.outfit,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundLight,
        foregroundColor: AppColors.textPrimaryLight,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.vibrantTeal,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.vibrantTeal,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
      extensions: const [
        AppColorsExtension.dark,
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.vibrantTeal,
        primary: AppColors.vibrantTeal,
        secondary: AppColors.deepNavyBlue,
        surface: AppColors.containerDark,
        error: AppColors.error,
        brightness: Brightness.dark,
      ),
      fontFamily: isArabic ? AppFonts.ibmPlexSansArabic : AppFonts.outfit,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.vibrantTeal,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
