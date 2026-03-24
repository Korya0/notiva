import 'package:flutter/material.dart';
import 'package:notiva/core/theme/app_theme_extension.dart';

extension ThemeHelperExtension on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
