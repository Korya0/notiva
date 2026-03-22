import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamilyOutfit = 'Outfit';
  static const String fontFamilyArabic = 'IBMPlexSansArabic';
  static String getFontFamily(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'en' ? fontFamilyArabic : fontFamilyOutfit;
  }

  static TextStyle headlineLarge(BuildContext context) => TextStyle(
    fontFamily: getFontFamily(context),
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onSurface,
  );
}
