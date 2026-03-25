import 'package:flutter/material.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  const AppTextThemeExtension({
    required this.errorTitleLarge,
    required this.errorTitleMedium,
    required this.errorLabelLarge,
    required this.buttonText,
  });

  final TextStyle errorTitleLarge;
  final TextStyle errorTitleMedium;
  final TextStyle errorLabelLarge;
  final TextStyle buttonText;

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? errorTitleLarge,
    TextStyle? errorTitleMedium,
    TextStyle? errorLabelLarge,
    TextStyle? buttonText,
  }) {
    return AppTextThemeExtension(
      errorTitleLarge: errorTitleLarge ?? this.errorTitleLarge,
      errorTitleMedium: errorTitleMedium ?? this.errorTitleMedium,
      errorLabelLarge: errorLabelLarge ?? this.errorLabelLarge,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  @override
  ThemeExtension<AppTextThemeExtension> lerp(
    covariant ThemeExtension<AppTextThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTextThemeExtension) return this;
    return AppTextThemeExtension(
      errorTitleLarge:
          TextStyle.lerp(errorTitleLarge, other.errorTitleLarge, t) ??
          errorTitleLarge,
      errorTitleMedium:
          TextStyle.lerp(errorTitleMedium, other.errorTitleMedium, t) ??
          errorTitleMedium,
      errorLabelLarge:
          TextStyle.lerp(errorLabelLarge, other.errorLabelLarge, t) ??
          errorLabelLarge,
      buttonText: TextStyle.lerp(buttonText, other.buttonText, t) ?? buttonText,
    );
  }
}
