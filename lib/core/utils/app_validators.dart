import 'package:flutter/material.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';

class AppValidators {
  static String? required(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.fieldRequired;
    }
    return null;
  }

  static String? email(BuildContext context, String? value) {
    final requiredError = required(context, value);
    if (requiredError != null) return requiredError;

    final noArabicError = noArabic(context, value);
    if (noArabicError != null) return noArabicError;

    if (!value!.contains('@') || !value.contains('.')) {
      return context.l10n.invalidEmailParts;
    }

    if (!RegExp(r'^[\w-\.]{2,}@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return context.l10n.invalidEmail;
    }
    return null;
  }

  static String? name(BuildContext context, String? value) {
    final requiredError = required(context, value);
    if (requiredError != null) return requiredError;

    if (value!.trim().length < 3) {
      return context.l10n.nameTooShort;
    }
    return null;
  }

  static String? password(BuildContext context, String? value) {
    final requiredError = required(context, value);
    if (requiredError != null) return requiredError;

    final noArabicError = noArabic(context, value);
    if (noArabicError != null) return noArabicError;

    if (value!.length < 6) {
      return context.l10n.passwordTooShort;
    }
    return null;
  }

  /// Validates that the input does not contain Arabic characters.
  static String? noArabic(BuildContext context, String? value) {
    if (value != null && RegExp(r'[\u0600-\u06FF]').hasMatch(value)) {
      return context.l10n.noArabicAllowed;
    }
    return null;
  }
}
