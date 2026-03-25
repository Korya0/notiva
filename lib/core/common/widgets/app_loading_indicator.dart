import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notiva/core/utils/extensions/platform_helper_extension.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    this.color = Colors.white,
    this.strokeWidth = 2,
    super.key,
  });

  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    if (context.isIOS) {
      return CupertinoActivityIndicator(color: color);
    }
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}
