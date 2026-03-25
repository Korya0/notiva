import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/common/widgets/app_button.dart';
import 'package:notiva/core/common/widgets/app_dialogs.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:notiva/features/auth/presentation/widgets/fields/email_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _ec = TextEditingController();
  final _fk = GlobalKey<FormState>();

  @override
  void dispose() {
    _ec.dispose();
    super.dispose();
  }

  Future<void> _onSRL() async {
    if (_fk.currentState!.validate()) {
      await context.read<AuthCubit>().forgotPassword(_ec.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (c, s) async {
        if (s is AuthPasswordResetSent) {
          await AppDialogs.showInfoDialog(
            context: c,
            title: c.l10n.success,
            message: c.l10n.checkEmailAndSpam,
            barrierDismissible: false,
          );
          if (c.mounted) {
            c.go(AppRoutes.login);
          }
        }
      },
      builder: (c, s) => Form(
        key: _fk,
        child: Column(
          children: [
            EmailField(controller: _ec),
            const SizedBox(height: 32),
            AppButton(
              text: context.l10n.sendResetLink,
              isLoading: s is AuthLoading,
              onPressed: _onSRL,
            ),
          ],
        ),
      ),
    );
  }
}
