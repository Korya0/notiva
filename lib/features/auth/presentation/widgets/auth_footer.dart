import 'package:flutter/material.dart';
import 'package:notiva/core/common/widgets/app_text_button.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    required this.question,
    required this.actionText,
    required this.onActionPressed,
    super.key,
  });

  final String question;
  final String actionText;
  final VoidCallback onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: context.fonts.bodySmall,
        ),
        AppTextButton(
          text: actionText,
          textStyle: context.fonts.labelSmall!.copyWith(
            color: context.colors.mainColor,
            fontWeight: FontWeight.w700,
          ),
          onPressed: onActionPressed,
        ),
      ],
    );
  }
}
