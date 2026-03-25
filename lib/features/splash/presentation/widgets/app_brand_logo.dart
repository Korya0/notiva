import 'package:flutter/material.dart';
import 'package:notiva/core/constants/app_assets.dart';
import 'package:notiva/core/theme/app_colors.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';

class AppBrandLogo extends StatelessWidget {
  const AppBrandLogo({
    super.key,
    this.logoWidth = 50,
    this.fontSize,
  });

  final double logoWidth;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.logo,
            width: logoWidth,
            errorBuilder: (context, error, stackTrace) {
              return Text(
                'N',
                style: context.textStyles.displayLarge!.copyWith(
                  fontSize: fontSize ?? 70,
                ),
              );
            },
          ),
          Text(
            'otiva',
            style: context.textStyles.displayLarge!.copyWith(
              color: AppColors.midnightBlue,
              fontSize: fontSize ?? 70,
            ),
          ),
        ],
      ),
    );
  }
}
