import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_colors.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.mainColor,
    required this.secondaryColor,
    required this.scaffoldBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.containerBackground,
    required this.error,
  });

  final Color mainColor;
  final Color secondaryColor;
  final Color scaffoldBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color containerBackground;
  final Color error;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? mainColor,
    Color? secondaryColor,
    Color? scaffoldBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? containerBackground,
    Color? error,
  }) {
    return AppColorsExtension(
      mainColor: mainColor ?? this.mainColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      containerBackground: containerBackground ?? this.containerBackground,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      mainColor: Color.lerp(mainColor, other.mainColor, t) ?? mainColor,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t) ?? secondaryColor,
      scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t) ?? scaffoldBackground,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      containerBackground: Color.lerp(containerBackground, other.containerBackground, t) ?? containerBackground,
      error: Color.lerp(error, other.error, t) ?? error,
    );
  }

  static const AppColorsExtension light = AppColorsExtension(
    mainColor: AppColors.deepTeal,
    secondaryColor: AppColors.midnightBlue,
    scaffoldBackground: AppColors.scaffoldBackgroundLight,
    textPrimary: AppColors.textPrimaryLight,
    textSecondary: AppColors.textSecondaryLight,
    containerBackground: AppColors.containerLight,
    error: AppColors.error,
  );

  static const AppColorsExtension dark = AppColorsExtension(
    mainColor: AppColors.accentTeal,
    secondaryColor: AppColors.platinum,
    scaffoldBackground: AppColors.scaffoldBackgroundDark,
    textPrimary: AppColors.textPrimaryDark,
    textSecondary: AppColors.textSecondaryDark,
    containerBackground: AppColors.containerDark,
    error: AppColors.error,
  );
}
