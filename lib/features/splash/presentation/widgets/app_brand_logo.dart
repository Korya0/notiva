import 'package:flutter/material.dart';
import 'package:notiva/core/constants/app_assets.dart';
import 'package:notiva/core/theme/app_colors.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

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
    // Force LTR to ensure Logo is always on the left and 'otiva' on the right
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
                style: AppTextStyles.font70w400Secondary(context).copyWith(
                  fontSize: fontSize ?? 70,
                ),
              );
            },
          ),
          Text(
            'otiva',
            style: AppTextStyles.font70w400Secondary(context).copyWith(
              color: AppColors.deepNavyBlue,
              fontSize: fontSize ?? 70,
            ),
          ),
        ],
      ),
    );
  }
}
