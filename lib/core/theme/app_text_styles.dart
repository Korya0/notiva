import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';
import 'package:notiva/core/theme/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font70w400Secondary(BuildContext context) => TextStyle(
    fontFamily: AppFonts.getFamily(context),
    fontSize: 70,
    fontWeight: FontWeight.w400,
    letterSpacing: -3,
    color: context.colors.secondaryColor,
  );

  static TextStyle font24W700Secondary(BuildContext context) => TextStyle(
    fontFamily: AppFonts.getFamily(context),
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: context.colors.secondaryColor,
  );

  static TextStyle font16W400textSecondary(BuildContext context) => TextStyle(
    fontFamily: AppFonts.getFamily(context),
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: context.colors.textSecondary,
  );

  static TextStyle font16W900MainColor(BuildContext context) => TextStyle(
    fontFamily: AppFonts.getFamily(context),
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: context.colors.mainColor,
  );

  static TextStyle font18W700White(BuildContext context) => TextStyle(
    fontFamily: AppFonts.getFamily(context),
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
