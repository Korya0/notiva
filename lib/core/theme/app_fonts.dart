import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  static const String outfit = 'Outfit';
  static const String ibmPlexSansArabic = 'IBMPlexSansArabic';

  static String getFamily(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ar' ? ibmPlexSansArabic : outfit;
  }
}
