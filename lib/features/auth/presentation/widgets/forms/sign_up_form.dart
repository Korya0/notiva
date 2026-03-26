import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notiva/core/common/widgets/app_button.dart';
import 'package:notiva/core/utils/extensions/app_localizations_extension.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:notiva/features/auth/presentation/cubit/auth/auth_state.dart';
import 'package:notiva/features/auth/presentation/widgets/fields/email_field.dart';
import 'package:notiva/features/auth/presentation/widgets/fields/name_field.dart';
import 'package:notiva/features/auth/presentation/widgets/fields/password_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nc = TextEditingController();
  final _ec = TextEditingController();
  final _pc = TextEditingController();
  final _fk = GlobalKey<FormState>();

  @override
  void dispose() {
    _nc.dispose();
    _ec.dispose();
    _pc.dispose();
    super.dispose();
  }

  Future<void> _onReg() async {
    if (_fk.currentState!.validate()) {
      await context.read<AuthCubit>().signUpWithEmail(
        email: _ec.text,
        password: _pc.text,
        name: _nc.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (c, s) => AutofillGroup(
        child: Form(
          key: _fk,
          child: Column(
            children: [
              NameField(controller: _nc)
                  .animate()
                  .fade(delay: 200.ms, duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),
              const SizedBox(height: 16),
              EmailField(controller: _ec)
                  .animate()
                  .fade(delay: 300.ms, duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),
              const SizedBox(height: 16),
              PasswordField(controller: _pc)
                  .animate()
                  .fade(delay: 400.ms, duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),
              const SizedBox(height: 32),
              AppButton(
                text: context.l10n.signup,
                isLoading: s is AuthLoading,
                onPressed: _onReg,
              ).animate().fade(delay: 500.ms, duration: 400.ms).slideY(begin: 0.1, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
