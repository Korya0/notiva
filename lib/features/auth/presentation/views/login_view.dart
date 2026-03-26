import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/common/widgets/app_dialogs.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:notiva/features/auth/presentation/utils/auth_failure_message.dart';
import 'package:notiva/features/auth/presentation/widgets/auth_footer.dart';
import 'package:notiva/features/auth/presentation/widgets/auth_header.dart';
import 'package:notiva/features/auth/presentation/widgets/forms/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To save space for the header
      appBar: AppBar(),
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
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
            child: _LoginBody(),
          ),
        ),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthHeader(
            title: context.l10n.welcomeBack,
            subtitle: context.l10n.enterDetails,
          ),
          const LoginForm(),
          const SizedBox(height: 32),
          AuthFooter(
            question: context.l10n.dontHaveAccount,
            actionText: context.l10n.signup,
            onActionPressed: () => context.push(AppRoutes.register),
          ),
        ],
      ),
    );
  }
}
