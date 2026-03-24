import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/Extension/app_localizations_extension.dart';
import 'package:notiva/core/Extension/platform_helper_extension.dart';
import 'package:notiva/core/theme/app_text_styles.dart';

class AppDialogs {
  static Future<void> showInfoDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
  }) async {
    if (context.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(
            title,
            style: AppTextStyles.font24W700Secondary(context),
          ),
          content: Text(
            message,
            style: AppTextStyles.font16W400textSecondary(context),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(buttonText ?? context.l10n.ok),
              onPressed: () => context.pop(),
            ),
          ],
        ),
      );
    }

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: AppTextStyles.font24W700Secondary(context),
        ),
        content: Text(
          message,
          style: AppTextStyles.font16W400textSecondary(context),
        ),
        actions: [
          TextButton(
            child: Text(buttonText ?? context.l10n.ok),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }

  static Future<void> showErrorDialog({
    required BuildContext context,
    required String message,
    String? title,
  }) async {
    return showInfoDialog(
      context: context,
      title: title ?? context.l10n.error,
      message: message,
    );
  }
}
