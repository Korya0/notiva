import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/theme/app_text_styles.dart';
import 'package:notiva/core/utils/haptic_feedback_helper.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.useHaptic = true,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final bool useHaptic;

  @override
  Widget build(BuildContext context) {
    void effectiveOnPressed() {
      if (useHaptic) unawaited(HapticFeedbackHelper.lightImpact());
      onPressed();
    }

    return context.isIOS
        ? _buildCupertinoButton(context, effectiveOnPressed)
        : _buildMaterialButton(context, effectiveOnPressed);
  }

  Widget _buildCupertinoButton(
    BuildContext context,
    VoidCallback effectiveOnPressed,
  ) {
    return CupertinoButton(
      onPressed: effectiveOnPressed,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      child: _buildText(context),
    );
  }

  Widget _buildMaterialButton(
    BuildContext context,
    VoidCallback effectiveOnPressed,
  ) {
    return TextButton(
      onPressed: effectiveOnPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: _buildText(context),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? AppTextStyles.font16W900MainColor(context),
    );
  }
}
