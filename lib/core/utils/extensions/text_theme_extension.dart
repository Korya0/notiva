import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_text_theme_extension.dart';

extension TextThemeHelperExtension on BuildContext {
  AppTextThemeExtension get customTextStyles =>
      Theme.of(this).extension<AppTextThemeExtension>()!;

  TextTheme get textStyles => Theme.of(this).textTheme;
}
