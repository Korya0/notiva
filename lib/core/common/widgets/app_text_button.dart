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
    return context.isIOS
        ? _buildCupertinoButton(context)
        : _buildMaterialButton(context);
  }

  Widget _buildCupertinoButton(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      child: _buildText(context),
    );
  }

  Widget _buildMaterialButton(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
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
