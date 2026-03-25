import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/core/utils/extensions/platform_helper_extension.dart';
import 'package:notiva/core/utils/extensions/text_theme_extension.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';

class AppDialogs {
  static Future<void> showInfoDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? buttonText,
    bool isError = false,
    bool barrierDismissible = true,
  }) async {
    final titleStyle = isError
        ? (context.isIOS
              ? context.customTextStyles.errorTitleMedium
              : context.customTextStyles.errorTitleLarge)
        : (context.isIOS
              ? context.textStyles.titleMedium!
              : context.textStyles.titleLarge!);

    final messageStyle = context.isIOS
        ? context.textStyles.bodySmall!
        : context.textStyles.bodyMedium!;

    final actionTextStyle = isError
        ? context.customTextStyles.errorLabelLarge
        : context.textStyles.labelLarge!;

    if (context.isIOS) {
      return showCupertinoDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (dialogContext) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(title, style: titleStyle),
          ),
          content: Text(message, style: messageStyle),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: isError,
              onPressed: () => dialogContext.pop(),
              child: Text(
                buttonText ?? context.l10n.ok,
                style: actionTextStyle,
              ),
            ),
          ],
        ),
      );
    }

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (dialogContext) => AlertDialog(
        backgroundColor: context.colors.containerBackground,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(
            color: context.colors.textSecondary.withValues(alpha: 0.1),
          ),
        ),
        titlePadding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    (isError ? context.colors.error : context.colors.mainColor)
                        .withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isError ? Icons.error_outline : Icons.check_circle_outline,
                color: isError
                    ? context.colors.error
                    : context.colors.mainColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(title, style: titleStyle, textAlign: TextAlign.center),
          ],
        ),
        content: Text(
          message,
          style: messageStyle.copyWith(
            height: 1.5,
            color: context.colors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: isError
                    ? context.colors.error.withValues(alpha: 0.1)
                    : context.colors.mainColor.withValues(alpha: 0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () => dialogContext.pop(),
              child: Text(
                buttonText ?? context.l10n.ok,
                style: actionTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isError
                      ? context.colors.error
                      : context.colors.mainColor,
                ),
              ),
            ),
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
      isError: true,
      barrierDismissible: false,
    );
  }
}
