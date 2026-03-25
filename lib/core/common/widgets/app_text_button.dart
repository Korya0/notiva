import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/utils/extensions/platform_helper_extension.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';
import 'package:notiva/core/utils/helpers/haptic_feedback_helper.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.text,
    this.onPressed,
    this.textStyle,
    this.useHaptic = true,
    this.padding,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final bool useHaptic;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = onPressed == null
        ? null
        : () {
            if (useHaptic) unawaited(HapticFeedbackHelper.lightImpact());
            onPressed!();
          };

    return context.isIOS
        ? _buildCupertinoButton(context, effectiveOnPressed)
        : _buildMaterialButton(context, effectiveOnPressed);
  }

  Widget _buildCupertinoButton(
    BuildContext context,
    VoidCallback? effectiveOnPressed,
  ) {
    return CupertinoButton(
      onPressed: effectiveOnPressed,
      padding: padding ?? EdgeInsets.zero,
      minimumSize: Size.zero,
      child: _buildContent(context),
    );
  }

  Widget _buildMaterialButton(
    BuildContext context,
    VoidCallback? effectiveOnPressed,
  ) {
    return TextButton(
      onPressed: effectiveOnPressed,
      style: TextButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? context.textStyles.labelLarge!,
    );
  }
}
