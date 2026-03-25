import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_colors.dart';
import 'package:notiva/core/theme/app_fonts.dart';
import 'package:notiva/core/theme/app_text_theme_extension.dart';
import 'package:notiva/core/theme/app_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static TextStyle _baseStyle(
    bool isArabic,
    double size,
    FontWeight weight,
    Color color, [
    double? ls,
  ]) => TextStyle(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: isArabic ? 0.0 : ls,
  );

  static TextTheme _createTextTheme(
    bool isArabic,
    AppColorsExtension colors,
  ) {
    return TextTheme(
      // displayLarge: Maps to 70w400Secondary
      displayLarge: _baseStyle(
        isArabic,
        70,
        FontWeight.w400,
        colors.secondaryColor,
        -3,
      ),
      // displayMedium: Maps to 32W700Secondary
      displayMedium: _baseStyle(
        isArabic,
        32,
        FontWeight.w700,
        colors.secondaryColor,
      ),
      // headlineLarge: Maps to 24W700Secondary
      headlineLarge: _baseStyle(
        isArabic,
        24,
        FontWeight.w700,
        colors.secondaryColor,
      ),
      // titleLarge: Maps to 22W700TextPrimary
      titleLarge: _baseStyle(
        isArabic,
        22,
        FontWeight.w700,
        colors.textPrimary,
      ),
      // titleMedium: Maps to 18W700TextPrimary
      titleMedium: _baseStyle(
        isArabic,
        18,
        FontWeight.w700,
        colors.textPrimary,
      ),
      // bodyLarge: Maps to 16W400TextPrimary
      bodyLarge: _baseStyle(
        isArabic,
        16,
        FontWeight.w400,
        colors.textPrimary,
      ),
      // bodyMedium: Maps to 16W400textSecondary
      bodyMedium: _baseStyle(
        isArabic,
        16,
        FontWeight.w400,
        colors.textSecondary,
      ),
      // bodySmall: Maps to 14W400TextSecondary
      bodySmall: _baseStyle(
        isArabic,
        14,
        FontWeight.w400,
        colors.textSecondary,
      ),
      // labelLarge: Maps to 16W900MainColor (usually for prominent actions)
      labelLarge: _baseStyle(
        isArabic,
        16,
        FontWeight.w900,
        colors.mainColor,
      ),
      // labelMedium: Maps to 14W600TextPrimary
      labelMedium: _baseStyle(
        isArabic,
        14,
        FontWeight.w600,
        colors.textPrimary,
      ),
      // labelSmall: Maps to 14W600MainColor
      labelSmall: _baseStyle(
        isArabic,
        14,
        FontWeight.w600,
        colors.mainColor,
      ),
    );
  }

  static AppTextThemeExtension _createCustomTextTheme(
    bool isArabic,
    AppColorsExtension colors,
    bool isDark,
  ) {
    return AppTextThemeExtension(
      errorTitleLarge: _baseStyle(isArabic, 22, FontWeight.w700, colors.error),
      errorTitleMedium: _baseStyle(isArabic, 18, FontWeight.w700, colors.error),
      errorLabelLarge: _baseStyle(isArabic, 16, FontWeight.w900, colors.error),
      buttonText: _baseStyle(
        isArabic,
        18,
        FontWeight.w700,
        isDark ? colors.scaffoldBackground : Colors.white,
      ),
    );
  }

  static ThemeData lightTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    final fontFamily = isArabic ? AppFonts.ibmPlexSansArabic : AppFonts.outfit;
    const colors = AppColorsExtension.light;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.deepTeal,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      fontFamily: fontFamily,
      textTheme: _createTextTheme(isArabic, colors),
      extensions: [
        colors,
        _createCustomTextTheme(isArabic, colors, false),
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.deepTeal,
        primary: AppColors.deepTeal,
        secondary: AppColors.midnightBlue,
        surface: AppColors.containerLight,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundLight,
        foregroundColor: AppColors.textPrimaryLight,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepTeal,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  static ThemeData darkTheme(Locale? locale) {
    final isArabic = locale?.languageCode == 'ar';
    final fontFamily = isArabic ? AppFonts.ibmPlexSansArabic : AppFonts.outfit;
    const colors = AppColorsExtension.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.accentTeal,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
      fontFamily: fontFamily,
      textTheme: _createTextTheme(isArabic, colors),
      extensions: [
        colors,
        _createCustomTextTheme(isArabic, colors, true),
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accentTeal,
        primary: AppColors.accentTeal,
        secondary: AppColors.platinum,
        surface: AppColors.containerDark,
        error: AppColors.error,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundDark,
        foregroundColor: AppColors.textPrimaryDark,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentTeal,
          foregroundColor: AppColors.scaffoldBackgroundDark,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
