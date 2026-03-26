import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/common/widgets/app_back_button.dart';
import 'package:notiva/core/common/widgets/app_dialogs.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:notiva/features/auth/presentation/utils/auth_failure_message.dart';
import 'package:notiva/features/auth/presentation/widgets/auth_header.dart';
import 'package:notiva/features/auth/presentation/widgets/forms/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
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
            child: _SignUpBody(),
          ),
        ),
      ),
    );
  }
}

class _SignUpBody extends StatelessWidget {
  const _SignUpBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AuthHeader(
            title: context.l10n.createAccount,
            subtitle: context.l10n.signupDescription,
          ),
          const SignUpForm(),
        ],
      ),
    );
  }
}
