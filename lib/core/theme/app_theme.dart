import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_colors.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.vibrantTeal,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.vibrantTeal,
        primary: AppColors.vibrantTeal,
        secondary: AppColors.deepNavyBlue,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
      ),
      fontFamily: isArabic
          ? AppTextStyles.fontFamilyArabic
          : AppTextStyles.fontFamilyOutfit,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceLight,
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
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.vibrantTeal,
        primary: AppColors.vibrantTeal,
        secondary: AppColors.deepNavyBlue,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
        brightness: Brightness.dark,
      ),
      fontFamily: isArabic
          ? AppTextStyles.fontFamilyArabic
          : AppTextStyles.fontFamilyOutfit,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceDark,
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
