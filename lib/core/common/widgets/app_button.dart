import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/common/widgets/app_loading_indicator.dart';
import 'package:notiva/core/utils/extensions/platform_helper_extension.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';
import 'package:notiva/core/utils/helpers/haptic_feedback_helper.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    this.text,
    this.child,
    this.isLoading = false,
    this.backgroundColor,
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
  final Color? backgroundColor;
  final double height;
  final double width;
  final double borderRadius;
  final Color? disabledColor;
  final bool useHaptic;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor =
        backgroundColor ?? context.colors.secondaryColor;
    final effectiveDisabledColor =
        disabledColor ?? effectiveBgColor.withValues(alpha: 0.7);

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
          ? _buildCupertinoButton(
              context,
              effectiveBgColor,
              effectiveDisabledColor,
              handlePressed,
            )
          : _buildMaterialButton(
              context,
              effectiveBgColor,
              effectiveDisabledColor,
              handlePressed,
            ),
    );
  }

  Widget _buildCupertinoButton(
    BuildContext context,
    Color bgColor,
    Color disabledColor,
    VoidCallback? onPressed,
  ) {
    return CupertinoButton(
      color: bgColor,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      padding: EdgeInsets.zero,
      disabledColor: disabledColor,
      child: _buildButtonContent(context),
    );
  }

  Widget _buildMaterialButton(
    BuildContext context,
    Color bgColor,
    Color disabledColor,
    VoidCallback? onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        disabledBackgroundColor: disabledColor,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: _buildButtonContent(context),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return const AppLoadingIndicator();
    }
    return child ??
        Text(
          text!,
          style: textStyle ?? context.customTextStyles.buttonText,
          textAlign: TextAlign.center,
        );
  }
}
