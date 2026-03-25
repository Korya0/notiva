import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notiva/core/common/widgets/app_button.dart';
import 'package:notiva/core/common/widgets/app_text_button.dart';
import 'package:notiva/core/router/app_routes.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/core/utils/extensions/theme_helper_extension.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:notiva/features/auth/presentation/widgets/fields/email_field.dart';
import 'package:notiva/features/auth/presentation/widgets/fields/password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _ec = TextEditingController();
  final _pc = TextEditingController();
  final _fk = GlobalKey<FormState>();

  @override
  void dispose() {
    _ec.dispose();
    _pc.dispose();
    super.dispose();
  }

  Future<void> _onLogin() async {
    if (_fk.currentState!.validate()) {
      await context.read<AuthCubit>().signInWithEmail(
        email: _ec.text,
        password: _pc.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (c, s) => Form(
        key: _fk,
        child: Column(
          children: [
            EmailField(controller: _ec),
            const SizedBox(height: 16),
            PasswordField(controller: _pc),
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AppTextButton(
                text: context.l10n.forgotPassword,
                textStyle: context.fonts.labelSmall,
                onPressed: () => context.push(AppRoutes.forgotPassword),
              ),
            ),
            const SizedBox(height: 8),
            AppButton(
              text: context.l10n.login,
              isLoading: s is AuthLoading,
              onPressed: _onLogin,
            ),
          ],
        ),
      ),
    );
  }
}
