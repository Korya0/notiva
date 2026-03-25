import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';
import 'package:notiva/core/common/widgets/app_loading_indicator.dart';
import 'package:notiva/core/theme/app_text_styles.dart';
import 'package:notiva/core/utils/haptic_feedback_helper.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    this.text,
    this.child,
    this.isLoading = false,
    this.backgroundColor,
    this.height = 56,
    this.borderRadius = 16,
    this.disabledColor,
    this.useHaptic = true,
    super.key,
  }) : assert(text != null || child != null, 'Must provide text or child');

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final bool isLoading;
  final Color? backgroundColor;
  final double height;
  final double borderRadius;
  final Color? disabledColor;
  final bool useHaptic;

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = onPressed == null
        ? null
        : () {
            if (useHaptic) unawaited(HapticFeedbackHelper.lightImpact());
            onPressed!();
          };

    final bgColor = (backgroundColor ?? context.colors.secondaryColor)!;
    final effectiveDisabledColor =
        disabledColor ?? bgColor.withValues(alpha: 0.7);

    return context.isIOS
        ? _buildCupertinoButton(
            context,
            bgColor,
            effectiveDisabledColor,
            effectiveOnPressed,
          )
        : _buildMaterialButton(
            context,
            bgColor,
            effectiveDisabledColor,
            effectiveOnPressed,
          );
  }

  Widget _buildCupertinoButton(
    BuildContext context,
    Color bgColor,
    Color disabledColor,
    void Function()? effectiveOnPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: CupertinoTheme(
        data: CupertinoThemeData(primaryColor: bgColor),
        child: CupertinoButton.filled(
          onPressed: isLoading ? null : effectiveOnPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          padding: EdgeInsets.zero,
          disabledColor: disabledColor,
          child: _buildButtonContent(context),
        ),
      ),
    );
  }

  Widget _buildMaterialButton(
    BuildContext context,
    Color bgColor,
    Color disabledColor,
    void Function()? effectiveOnPressed,
  ) {
    return ElevatedButton(
      onPressed: isLoading ? null : effectiveOnPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, height),
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
          style: AppTextStyles.font18W700White(context),
        );
  }
}
