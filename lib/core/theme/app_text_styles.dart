import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font70w400Secondary(BuildContext context) => TextStyle(
    fontFamily: AppFonts.getFamily(context),
    fontSize: 70,
    fontWeight: FontWeight.w400,
    letterSpacing: -3,
    color: Theme.of(context).colorScheme.secondary,
  );
}
