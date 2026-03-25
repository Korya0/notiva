import 'package:flutter/widgets.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/auth/domain/entities/auth_failure.dart';

extension AuthFailureMessage on AuthFailure {
  String toMessage(BuildContext context) {
    return switch (this) {
      ServerFailure() => context.l10n.serverError,
      NetworkFailure() => context.l10n.networkError,
      InvalidCredentialsFailure() => context.l10n.invalidCredentials,
      EmailAlreadyInUseFailure() => context.l10n.emailAlreadyInUse,
      WeakPasswordFailure() => context.l10n.weakPassword,
      TooManyRequestsFailure() => context.l10n.tooManyRequests,
      UserDisabledFailure() => context.l10n.userDisabled,
      OperationNotAllowedFailure() => context.l10n.operationNotAllowed,
      RequiresRecentLoginFailure() => context.l10n.requiresRecentLogin,
      AccountExistsWithDifferentCredentialFailure() =>
        context.l10n.accountExistsWithDifferentCredential,
      InvalidActionCodeFailure() => context.l10n.invalidActionCode,
      CancellationFailure() => context.l10n.authCancelled,
      UnknownAuthFailure() => context.l10n.unknownError,
    };
  }
}
