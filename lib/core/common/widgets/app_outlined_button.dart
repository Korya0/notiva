import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';
import 'package:notiva/core/common/widgets/app_loading_indicator.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.onPressed,
    this.text,
    this.child,
    this.isLoading = false,
    this.color,
    this.height = 56,
    this.borderRadius = 16,
    this.disabledColor,
    super.key,
  }) : assert(text != null || child != null, 'Must provide text or child');

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final bool isLoading;
  final Color? color;
  final double height;
  final double borderRadius;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    final themeColor = (color ?? context.colors.mainColor)!;
    final effectiveDisabledColor =
        disabledColor ?? themeColor.withValues(alpha: 0.5);

    return context.isIOS
        ? _buildCupertinoButton(context, themeColor, effectiveDisabledColor)
        : _buildMaterialButton(context, themeColor, effectiveDisabledColor);
  }

  Widget _buildCupertinoButton(
    BuildContext context,
    Color themeColor,
    Color disabledColor,
  ) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: isLoading ? disabledColor : themeColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CupertinoButton(
        onPressed: isLoading ? null : onPressed,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(borderRadius),
        child: _buildButtonContent(context, themeColor),
      ),
    );
  }

  Widget _buildMaterialButton(
    BuildContext context,
    Color themeColor,
    Color disabledColor,
  ) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, height),
        side: BorderSide(color: isLoading ? disabledColor : themeColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        disabledForegroundColor: disabledColor,
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
          style: AppTextStyles.font18W700White(context).copyWith(
            color: themeColor,
          ),
        );
  }
}
