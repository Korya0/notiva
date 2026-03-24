import 'package:flutter/widgets.dart';
import 'package:notiva/core/Extension/app_localizations_extension.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';

extension AuthFailureMessage on AuthFailure {
  String toMessage(BuildContext context) {
    if (this is ServerFailure) return context.l10n.serverError;
    if (this is NetworkFailure) return context.l10n.networkError;
    if (this is InvalidCredentialsFailure) return context.l10n.invalidCredentials;
    if (this is EmailAlreadyInUseFailure) return context.l10n.emailAlreadyInUse;
    if (this is WeakPasswordFailure) return context.l10n.weakPassword;
    if (this is TooManyRequestsFailure) return context.l10n.tooManyRequests;
    if (this is UserDisabledFailure) return context.l10n.userDisabled;
    if (this is OperationNotAllowedFailure) return context.l10n.operationNotAllowed;
    return context.l10n.unknownError;
  }
}
