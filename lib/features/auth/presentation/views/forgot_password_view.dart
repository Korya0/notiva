import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/common/widgets/app_back_button.dart';
import 'package:notiva/core/common/widgets/app_dialogs.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:notiva/features/auth/presentation/utils/auth_failure_message.dart';
import 'package:notiva/features/auth/presentation/widgets/auth_footer.dart';
import 'package:notiva/features/auth/presentation/widgets/auth_header.dart';
import 'package:notiva/features/auth/presentation/widgets/forms/forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (c, s) {
          if (s is AuthError) {
            unawaited(
              AppDialogs.showErrorDialog(
                context: c,
                message: s.failure.toMessage(c),
              ),
            );
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: _ForgotPasswordBody(),
        ),
      ),
    );
  }
}

class _ForgotPasswordBody extends StatelessWidget {
  const _ForgotPasswordBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthHeader(
            title: context.l10n.forgotPassword,
            subtitle: context.l10n.passwordResetInstruction,
          ),
          const ForgotPasswordForm(),
          const SizedBox(height: 32),
          AuthFooter(
            question: context.l10n.rememberPassword,
            actionText: context.l10n.login,
            onActionPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
