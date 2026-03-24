import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/Extension/theme_helper_extension.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.onPressed,
    this.text,
    this.child,
    this.color,
    this.height = 56,
    this.borderRadius = 16,
    super.key,
  }) : assert(text != null || child != null, 'Must provide text or child');

  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final themeColor = (color ?? context.colors.mainColor)!;

    if (context.isIOS) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: themeColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          borderRadius: BorderRadius.circular(borderRadius),
          child:
              child ??
              Text(
                text!,
                style: TextStyle(color: themeColor),
              ),
        ),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0, height),
        side: BorderSide(color: themeColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: child ?? Text(text!),
    );
  }
}
