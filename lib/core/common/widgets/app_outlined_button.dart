import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/common/widgets/app_loading_indicator.dart';
import 'package:notiva/core/utils/extensions/platform_helper_extension.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';
import 'package:notiva/core/utils/helpers/haptic_feedback_helper.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.onPressed,
    this.text,
    this.child,
    this.isLoading = false,
    this.color,
    this.height = 56,
    this.width = double.infinity,
    this.borderRadius = 16,
    this.disabledColor,
    this.useHaptic = true,
    this.textStyle,
    super.key,
  }) : assert(text != null || child != null, 'Must provide text or child');

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final bool isLoading;
  final Color? color;
  final double height;
  final double width;
  final double borderRadius;
  final Color? disabledColor;
  final bool useHaptic;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? context.colors.mainColor;
    final effectiveDisabledColor =
        disabledColor ?? themeColor.withValues(alpha: 0.5);

    final handlePressed = (onPressed == null || isLoading)
        ? null
        : () {
            if (useHaptic) unawaited(HapticFeedbackHelper.lightImpact());
            onPressed!();
          };

    return SizedBox(
      width: width,
      height: height,
      child: context.isIOS
          ? _buildCupertino(
              context,
              themeColor,
              effectiveDisabledColor,
              handlePressed,
            )
          : _buildMaterial(
              context,
              themeColor,
              effectiveDisabledColor,
              handlePressed,
            ),
    );
  }

  Widget _buildCupertino(
    BuildContext context,
    Color themeColor,
    Color disabledColor,
    VoidCallback? onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: onPressed == null ? disabledColor : themeColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(borderRadius),
        child: _buildButtonContent(context, themeColor),
      ),
    );
  }

  Widget _buildMaterial(
    BuildContext context,
    Color themeColor,
    Color disabledColor,
    VoidCallback? onPressed,
  ) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: onPressed == null ? disabledColor : themeColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.zero,
      ),
      child: _buildButtonContent(context, themeColor),
    );
  }

  Widget _buildButtonContent(BuildContext context, Color themeColor) {
    if (isLoading) {
      return AppLoadingIndicator(color: themeColor);
    }
    return child ??
        Text(
          text!,
          textAlign: TextAlign.center,
          style: (textStyle ?? context.customTextStyles.buttonText).copyWith(
            color: themeColor,
          ),
        );
  }
}
