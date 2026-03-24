import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    this.text,
    this.child,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.height = 56,
    this.borderRadius = 16,
    super.key,
  }) : assert(text != null || child != null, 'Must provide text or child');

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final themeBgColor = (backgroundColor ?? context.colors.secondaryColor)!;

    if (context.isIOS) {
      return SizedBox(
        width: double.infinity,
        height: height,
        child: CupertinoTheme(
          data: CupertinoThemeData(
            primaryColor: themeBgColor,
          ),
          child: CupertinoButton.filled(
            onPressed: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(borderRadius),
            padding: EdgeInsets.zero,
            disabledColor: themeBgColor.withValues(
              alpha: 0.5,
            ),
            child: isLoading
                ? const CupertinoActivityIndicator(color: Colors.white)
                : (child ??
                      Text(
                        text!,
                        style: AppTextStyles.font18W700White(context),
                      )),
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colors.secondaryColor,
        foregroundColor: foregroundColor,
        minimumSize: Size(double.infinity, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : (child ??
                Text(
                  text!,
                  style: AppTextStyles.font18W700White(context),
                )),
    );
  }
}
