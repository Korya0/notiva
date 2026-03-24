import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.onPressed,
    required this.text,
    this.textStyle,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.font16W900MainColor(context),
        ),
      );
    }

    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.font16W900MainColor(context),
      ),
    );
  }
}
